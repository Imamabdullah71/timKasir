import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:tim_kasir/Views/management_barang/page_menu_management/Barang/image_editor_page.dart';
import 'package:image/image.dart' as img;

class TambahBarangController extends GetxController {
  var barangData = {
    'nama_barang': ''.obs,
    'stok_barang': ''.obs,
    'kode_barang': ''.obs,
    'kategori_id': ''.obs,
    'foto_url': ''.obs,
  }.obs;

  var hargaData = {
    'harga_beli': ''.obs,
    'harga_jual': ''.obs,
  }.obs;

  var kategoriList = <Map<String, dynamic>>[].obs;
  var selectedKategori = ''.obs;
  var barcode = ''.obs;
  var imageFile = Rx<Uint8List?>(null);
  var croppedImageFile = Rx<Uint8List?>(null);

  final CropController cropController = CropController();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('kategori').get();
    kategoriList.value = snapshot.docs.map((doc) {
      var data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = await pickedFile.readAsBytes();
      Get.to(() => ImageEditorPage());
    } else {
      Get.snackbar('Error', 'Tidak ada gambar yang dipilih');
    }
  }

  void cropImage() {
    if (imageFile.value != null) {
      cropController.crop();
    }
  }

  Future<String?> uploadImage(String docId) async {
    if (croppedImageFile.value == null) return null;

    try {
      // Decode the image to compress it
      img.Image? originalImage = img.decodeImage(croppedImageFile.value!);
      if (originalImage == null) {
        throw Exception("Gagal memuat gambar untuk kompresi");
      }

      // Kompresi gambar
      img.Image compressedImage = img.copyResize(
        originalImage,
        width: 800, // Ubah ukuran sesuai kebutuhan
      );

      // Encode kembali ke format JPEG dengan kompresi
      Uint8List compressedImageBytes = Uint8List.fromList(
        img.encodeJpg(compressedImage,
            quality: 85), // Kompresi dengan kualitas 85%
      );

      // Mengunggah gambar yang telah dikompresi ke Firebase Storage
      final ref = FirebaseStorage.instance
          .ref()
          .child('barang_images')
          .child('$docId.jpg');
      await ref.putData(compressedImageBytes);

      // Mengembalikan URL gambar yang telah diunggah
      return await ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengunggah gambar: $e');
      return null;
    }
  }

  void tambahBarang() async {
    // Validasi input sebelum menambahkan barang
    // if (barangData['nama_barang']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Nama barang harus diisi');
    //   return;
    // }

    // if (hargaData['harga_beli']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Harga beli harus diisi');
    //   return;
    // }

    // if (hargaData['harga_jual']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Harga jual harus diisi');
    //   return;
    // }

    // if (barangData['stok_barang']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Stok barang harus diisi');
    //   return;
    // }

    // if (barangData['kode_barang']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Kode barang harus diisi');
    //   return;
    // }

    // if (barangData['kategori_id']?.value.isEmpty ?? true) {
    //   Get.snackbar('Error', 'Kategori harus dipilih');
    //   return;
    // }

    // if (croppedImageFile.value == null) {
    //   Get.snackbar('Error', 'Gambar belum dipilih');
    //   return;
    // }

    try {
      // Menambahkan barang ke Firestore
      final docRef = await FirebaseFirestore.instance.collection('barang').add({
        'nama_barang': barangData['nama_barang']?.value,
        'stok_barang': int.parse(barangData['stok_barang']?.value ?? '0'),
        'kode_barang': int.parse(barangData['kode_barang']?.value ?? '0'),
        'kategori_id': barangData['kategori_id']?.value,
        'foto_url': '', // akan di-update nanti
        'timestamp': Timestamp.now(),
      });

      // Unggah gambar dan perbarui URL gambar dalam koleksi barang dan harga secara paralel
      var uploadImageTask = uploadImage(docRef.id);
      var addHargaTask = FirebaseFirestore.instance.collection('harga').add({
        'barang_id': docRef.id,
        'harga_beli': double.parse(hargaData['harga_beli']?.value ?? '0'),
        'harga_jual': double.parse(hargaData['harga_jual']?.value ?? '0'),
      });

      // Tunggu kedua operasi selesai
      String? fotoUrl = await uploadImageTask;
      await addHargaTask;

      // Perbarui URL gambar setelah mengunggah
      if (fotoUrl != null) {
        await docRef.update({'foto_url': fotoUrl});
        barangData['foto_url']?.value = fotoUrl;
      }

      // Kembali ke halaman sebelumnya dan tampilkan notifikasi sukses
      Get.back();
      Get.snackbar(
        "Berhasil menambahkan barang!",
        "",
        duration: const Duration(milliseconds: 2000),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 10.0,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.easeOut,
        reverseAnimationCurve: Curves.easeIn,
        isDismissible: true,
        showProgressIndicator: false,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan barang: $e');
    }
  }

  void setField(String key, String value) {
    if (key == 'harga_beli' || key == 'harga_jual') {
      hargaData[key]?.value = value;
    } else {
      barangData[key]?.value = value;
    }
  }

  void setKategori(String kategori, String id) {
    selectedKategori.value = kategori;
    barangData['kategori_id']?.value = id;
  }

  void setBarcode(String code) {
    barcode.value = code;
    setField('kode_barang', code);
  }
  String formatNumber(double number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number.toInt()).replaceAll(',', '.');
  }
}
