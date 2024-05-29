import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void addProduct(String name, String price, String docID) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      await docData.update({
        "name": name,
        "price": price,
      });

      nameC.clear();
      priceC.clear();
      Get.offAllNamed("/bottom_bar");
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
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
