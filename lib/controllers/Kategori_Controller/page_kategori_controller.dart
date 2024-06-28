import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class PageKategoriController extends GetxController {
  late TextEditingController namaKategoriC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var imageFile = Rx<Uint8List?>(null);

  Stream<QuerySnapshot> get kategoriCollection => firestore.collection("kategori").snapshots();

  @override
  void onInit() {
    namaKategoriC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaKategoriC.dispose();
    super.onClose();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      // Compress the image
      Uint8List? compressedImage = await FlutterImageCompress.compressWithFile(
        pickedFile.path,
        minWidth: 800,
        minHeight: 800,
        quality: 80,
      );
      imageFile.value = compressedImage;
    } else {
      Get.snackbar('Error', 'Tidak ada gambar yang dipilih');
    }
  }

  Future<String?> uploadImage(String docId) async {
    if (imageFile.value == null) return null;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('kategori_images')
          .child('$docId.jpg');
      await ref.putData(imageFile.value!);
      return await ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengunggah gambar: $e');
      return null;
    }
  }

  void tambahKategori(String namaKategori) async {
    CollectionReference colKategori = firestore.collection("kategori");

    try {
      final docRef = await colKategori.add({
        "nama_kategori": namaKategori,
        "timestamp": Timestamp.now(),
        "foto_url": "",
      });

      String? fotoUrl = await uploadImage(docRef.id);
      if (fotoUrl != null) {
        await docRef.update({'foto_url': fotoUrl});
      }

      namaKategoriC.clear();
      imageFile.value = null;
      Get.back();
      Get.snackbar(
        "Berhasil menambahkan kategori!",
        "",
        duration: const Duration(milliseconds: 1500),
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
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menambahkan kategori! $e",
      );
    }
  }

  void hapusKategori(String docId) async {
    DocumentReference docRef = firestore.collection("kategori").doc(docId);

    try {
      Get.defaultDialog(
        title: "Apakah yakin ingin menghapus data?",
        middleText: "Data akan dihapus permanen!",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
          Get.snackbar(
            "Berhasil menghapus kategori!",
            "",
            duration: const Duration(milliseconds: 1500),
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
        },
        textConfirm: "Ya",
        textCancel: "Kembali",
        onCancel: () => Get.back(),
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menghapus kategori! $e",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getKategoriData(String docID) async {
    DocumentReference docRef = firestore.collection("kategori").doc(docID);
    return docRef.get();
  }

  void updateKategori(String namaKategori, String docID) async {
    DocumentReference docData = firestore.collection("kategori").doc(docID);

    try {
      await docData.update({
        "nama_kategori": namaKategori,
      });

      namaKategoriC.clear();
      Get.back();
      Get.snackbar(
        "Berhasil update!",
        "",
        duration: const Duration(milliseconds: 1500),
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
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal mengubah kategori! $e",
      );
    }
  }

  void updateKategoriWithImage(String namaKategori, String docID, String newImageUrl) async {
    DocumentReference docData = firestore.collection("kategori").doc(docID);

    try {
      await docData.update({
        "nama_kategori": namaKategori,
        "foto_url": newImageUrl,
      });

      namaKategoriC.clear();
      imageFile.value = null;
      Get.back();
      Get.snackbar(
        "Berhasil update!",
        "",
        duration: const Duration(milliseconds: 1500),
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
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal mengubah kategori! $e",
      );
    }
  }
}
