import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageKategoriController extends GetxController {
  late TextEditingController namaKategoriC;

  // Inisialisai Firebase Firestore ke Variabel "firestore"
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fungsi Realtime get data Collection "kategori"
  Stream<QuerySnapshot> get kategoriCollection =>
      firestore.collection("kategori").snapshots();

  // Fungsi tambah(Create) Kategori
  void tambahKategori(String namaKategori) async {
    CollectionReference colKategori = firestore.collection("kategori");

    try {
      String dateNow = DateTime.now().toIso8601String();
      await colKategori.add({
        "nama_kategori": namaKategori,
        "time": dateNow,
      });

      namaKategoriC.clear();
      Get.back();
      Get.snackbar(
        "Berhasil menambahkan kategori!",
        "",
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 10.0,
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.easeOut,
        reverseAnimationCurve: Curves.easeIn,
        onTap: (snackbar) {
          print("Snackbar tapped!");
        },
        isDismissible: true,
        showProgressIndicator: false,
      );
    } catch (e) {
      print(e);

      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menambahkan produk! $e",
      );
    }
  }

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

  // Fungsi Hapus Kategori
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
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10.0,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            snackPosition: SnackPosition.BOTTOM,
            forwardAnimationCurve: Curves.easeOut,
            reverseAnimationCurve: Curves.easeIn,
            onTap: (snackbar) {
              print("Snackbar tapped!");
            },
            isDismissible: true,
            showProgressIndicator: false,
          );
        },
        textConfirm: "Ya",
        textCancel: "Kembali",
        onCancel: () => Get.back(),
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menghapus produk! $e",
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
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10.0,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            snackPosition: SnackPosition.BOTTOM,
            forwardAnimationCurve: Curves.easeOut,
            reverseAnimationCurve: Curves.easeIn,
            onTap: (snackbar) {
              print("Snackbar tapped!");
            },
            isDismissible: true,
            showProgressIndicator: false,
          );
    } catch (e) {
      print(e);

      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal mengubah produk! $e",
      );
    }
  }
}
