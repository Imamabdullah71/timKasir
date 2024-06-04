import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> get productsStream => firestore
      .collection("products")
      .orderBy("time", descending: true)
      .snapshots();

  void addProduct(String name, String price) async {
    CollectionReference products = firestore.collection("products");

    try {
      String dateNow = DateTime.now().toIso8601String();
      await products.add({
        "name": name,
        "price": price,
        "time": dateNow,
      });

      nameC.clear();
      priceC.clear();

      Get.offAllNamed("/bottom_bar");

      Get.snackbar("Berhasil", "Berhasil Menambahkan produk");
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
