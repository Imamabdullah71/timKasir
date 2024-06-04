import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBarangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var barangList = <Map<String, dynamic>>[].obs;
  var kategoriList = <Map<String, dynamic>>[].obs;
  var selectedCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchBarangs();
  }

  void fetchCategories() {
    FirebaseFirestore.instance
        .collection('kategori')
        .snapshots()
        .listen((snapshot) {
      kategoriList.value = snapshot.docs.map((doc) {
        var data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  void fetchBarangs() {
    FirebaseFirestore.instance
        .collection('barang')
        .orderBy("nama_barang")
        .snapshots()
        .listen((snapshot) {
      barangList.value = snapshot.docs.map((doc) {
        var data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  Future<String> getKategoriNama(String kategoriId) async {
    var doc = await FirebaseFirestore.instance
        .collection('kategori')
        .doc(kategoriId)
        .get();
    if (doc.exists && doc.data() != null) {
      return doc.data()!['nama_kategori'] ?? 'Tidak diketahui';
    } else {
      return 'Tidak diketahui';
    }
  }

  List<Map<String, dynamic>> get filteredBarangList {
    if (selectedCategories.isEmpty) {
      return barangList;
    } else {
      return barangList.where((barang) {
        return selectedCategories.contains(barang['kategori_id']);
      }).toList();
    }
  }

  void toggleCategorySelection(String categoryId) {
    if (selectedCategories.contains(categoryId)) {
      selectedCategories.remove(categoryId);
    } else {
      selectedCategories.add(categoryId);
    }
  }

  void hapusBarang(String docId) async {
    DocumentReference docRef = firestore.collection("barang").doc(docId);

    try {
      Get.defaultDialog(
        title: "Apakah yakin ingin menghapus data?",
        middleText: "Data akan dihapus permanen!",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
          Get.snackbar(
            "Data berhasil dihapus",
            "",
            duration: Duration(seconds: 3),
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
}
