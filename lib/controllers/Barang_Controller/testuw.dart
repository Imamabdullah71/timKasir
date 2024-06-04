import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class TambahBarangController extends GetxController {
  var barangData = {
    'nama_barang': ''.obs,
    'harga_beli': ''.obs,
    'harga_jual': ''.obs,
    'stok_barang': ''.obs,
    'kode_barang': ''.obs,
    'kategori_id': ''.obs,
    'foto_url': ''.obs,  // Tambahkan untuk URL foto
  }.obs;

  var kategoriList = <Map<String, dynamic>>[].obs;
  var selectedKategori = ''.obs;
  var barcode = ''.obs;
  var imageFile = Rx<XFile?>(null);

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

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = pickedFile;
    } else {
      Get.snackbar('Error', 'Tidak ada gambar yang dipilih');
    }
  }

  Future<String?> uploadImage(String docId) async {
    if (imageFile.value == null) return null;

    try {
      final ref = FirebaseStorage.instance.ref().child('barang_images').child('$docId.jpg');
      final uploadTask = ref.putFile(
        File(imageFile.value!.path),
        SettableMetadata(
          contentType: 'image/jpeg', // Atur tipe konten file
          customMetadata: {
            'uploaded_by': 'user_id', // Contoh metadata khusus
            'description': 'Image of a product',
          },
        ),
      );

      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengunggah gambar: $e');
      return null;
    }
  }

  void tambahBarang() async {
    if (barangData['nama_barang']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Nama barang harus diisi');
      return;
    }

    if (barangData['harga_beli']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Harga beli harus diisi');
      return;
    }

    if (barangData['harga_jual']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Harga jual harus diisi');
      return;
    }

    if (barangData['stok_barang']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Stok barang harus diisi');
      return;
    }

    if (barangData['kode_barang']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Kode barang harus diisi');
      return;
    }

    if (barangData['kategori_id']?.value.isEmpty ?? true) {
      Get.snackbar('Error', 'Kategori harus dipilih');
      return;
    }

    if (imageFile.value == null) {
      Get.snackbar('Error', 'Gambar belum dipilih');
      return;
    }

    String dateNow = DateTime.now().toIso8601String();

    final docRef = await FirebaseFirestore.instance.collection('barang').add({
      'nama_barang': barangData['nama_barang']?.value,
      'harga_beli': int.parse(barangData['harga_beli']?.value ?? '0'),
      'harga_jual': int.parse(barangData['harga_jual']?.value ?? '0'),
      'stok_barang': int.parse(barangData['stok_barang']?.value ?? '0'),
      'kode_barang': int.parse(barangData['kode_barang']?.value ?? '0'),
      'kategori_id': barangData['kategori_id']?.value,
      "time": dateNow,
    });

    String? fotoUrl = await uploadImage(docRef.id);

    if (fotoUrl != null) {
      await docRef.update({'foto_url': fotoUrl});
      barangData['foto_url']?.value = fotoUrl;
    }

    Get.back();
    Get.snackbar(
      "Berhasil menambahkan barang!",
      "",
      duration: Duration(milliseconds: 2000),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
      isDismissible: true,
      showProgressIndicator: false,
    );
  }

  void setField(String key, String value) {
    barangData[key]?.value = value;
  }

  void setKategori(String kategori, String id) {
    selectedKategori.value = kategori;
    barangData['kategori_id']?.value = id;
  }

  void setBarcode(String code) {
    barcode.value = code;
    setField('kode_barang', code);
  }
}
