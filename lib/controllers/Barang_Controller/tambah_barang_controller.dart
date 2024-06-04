import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahBarangController extends GetxController {
  var barangData = {
    'nama_barang': ''.obs,
    'harga_beli': ''.obs,
    'harga_jual': ''.obs,
    'stok_barang': ''.obs,
    'kode_barang': ''.obs,
    'kategori_id': ''.obs,
  }.obs;

  var kategoriList = <Map<String, dynamic>>[].obs;
  var selectedKategori = ''.obs;
  var barcode = ''.obs;

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

  void tambahBarang() async {
    if (barangData.values
        .every((rxValue) => (rxValue as RxString).value.isNotEmpty)) {
      String dateNow = DateTime.now().toIso8601String();

      await FirebaseFirestore.instance.collection('barang').add({
        'nama_barang': barangData['nama_barang']?.value,
        'harga_beli': int.parse(barangData['harga_beli']?.value ?? '0'),
        'harga_jual': int.parse(barangData['harga_jual']?.value ?? '0'),
        'stok_barang': int.parse(barangData['stok_barang']?.value ?? '0'),
        'kode_barang': int.parse(barangData['kode_barang']?.value ?? '0'),
        'kategori_id': barangData['kategori_id']?.value,
        "time": dateNow,
      });
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
    } else {
      Get.snackbar('Error', 'Semua field harus diisi');
    }
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
