import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  void deleteProduct(String docId) async {
    DocumentReference docRef = firestore.collection("products").doc(docId);

    try {
      Get.defaultDialog(
        title: "Apakah yakin ingin menghapus data?",
        middleText: "Data akan dihapus permanen!",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
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
}
