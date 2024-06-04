import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBarangController extends GetxController {
  var namaBarangController = TextEditingController();
  var hargaBarangController = TextEditingController();
  var kategoriList = <Map<String, dynamic>>[].obs;
  var selectedKategori = ''.obs;
  var selectedKategoriId = ''.obs;

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

  void setInitialValues(Map<String, dynamic> barang) async {
    namaBarangController.text = barang['nama_barang'];
    hargaBarangController.text = barang['harga_barang'].toString();
    selectedKategoriId.value = barang['kategori_id'];

    var doc = await FirebaseFirestore.instance
        .collection('kategori')
        .doc(barang['kategori_id'])
        .get();
    if (doc.exists && doc.data() != null) {
      selectedKategori.value =
          doc.data()!['nama_kategori'] ?? 'Tidak diketahui';
    }
  }

  void setKategori(String kategori, String id) {
    selectedKategori.value = kategori;
    selectedKategoriId.value = id;
  }

  void editBarang(String id) async {
    if (namaBarangController.text.isNotEmpty &&
        hargaBarangController.text.isNotEmpty &&
        selectedKategoriId.value.isNotEmpty) {
      await FirebaseFirestore.instance.collection('barang').doc(id).update({
        'nama_barang': namaBarangController.text,
        'harga_barang': int.parse(hargaBarangController.text),
        'kategori_id': selectedKategoriId.value,
      });
      Get.back();
      Get.snackbar("Berhasil", "Berhasil diupdate");
    } else {
      Get.snackbar('Error', 'Semua field harus diisi');
    }
  }


}
