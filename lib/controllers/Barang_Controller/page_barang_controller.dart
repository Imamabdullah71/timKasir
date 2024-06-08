// page_barang_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      List<Map<String, dynamic>> barangs = snapshot.docs.map((doc) {
        var data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();

      // Ambil harga untuk setiap barang
      barangs.forEach((barang) async {
        var hargaSnapshot = await FirebaseFirestore.instance
            .collection('harga')
            .where('barang_id', isEqualTo: barang['id'])
            .get();

        if (hargaSnapshot.docs.isNotEmpty) {
          var hargaData = hargaSnapshot.docs.first.data();
          barang['harga_jual'] = hargaData['harga_jual'];
          barang['harga_beli'] = hargaData['harga_beli'];
        } else {
          barang['harga_jual'] = 'Tidak ada harga';
          barang['harga_beli'] = 'Tidak ada harga';
        }
      });

      barangList.value = barangs;
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
      // Ambil URL foto sebelum menghapus dokumen
      var docSnapshot = await docRef.get();
      var data = docSnapshot.data() as Map<String, dynamic>?; // Cast data ke Map<String, dynamic>
      String? fotoUrl = data?['foto_url'];

      Get.defaultDialog(
        title: "Apakah yakin ingin menghapus data?",
        middleText: "Data akan dihapus permanen!",
        onConfirm: () async {
          // Hapus gambar dari Cloud Storage jika URL foto ada
          if (fotoUrl != null && fotoUrl.isNotEmpty) {
            try {
              var storageRef = FirebaseStorage.instance.refFromURL(fotoUrl);
              await storageRef.delete();
            } catch (e) {
              print("Gagal menghapus gambar: $e");
            }
          }

          // Hapus dokumen dari Firestore
          await docRef.delete();
          Get.back();
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