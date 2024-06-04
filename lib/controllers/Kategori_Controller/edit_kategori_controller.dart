import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductController extends GetxController {
  late TextEditingController namaKategoriC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
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
      Get.snackbar("Berhasil", "Berhasil Mengubah produk");
    } catch (e) {
      print(e);

      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal mengubah produk! $e",
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
}
