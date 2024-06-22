// lib/Controllers/Transaksi/image_search_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tim_kasir/Controllers/Transaksi/vision_service.dart';
import 'package:tim_kasir/Models/barang_model.dart';
import 'package:tim_kasir/Controllers/Transaksi/transaksi_controller.dart';

class ImageSearchController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final TransaksiController transaksiController = Get.find<TransaksiController>();
  final VisionService visionService = VisionService();

  // Fungsi untuk mengambil gambar menggunakan kamera dan mengunggahnya ke Firebase Storage
  Future<String?> uploadImageAndGetUrl() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo == null) {
      Get.snackbar(
        'Gagal',
        'Tidak ada gambar yang diambil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }

    // Mengunggah gambar ke Firebase Cloud Storage
    final fileName = photo.name;
    final storageRef = FirebaseStorage.instance.ref().child('images/$fileName');
    await storageRef.putFile(File(photo.path));

    // Mendapatkan URL gambar yang diunggah
    final String downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  // Fungsi utama untuk mengambil gambar dan mencari gambar serupa
  Future<void> searchByImage(BuildContext context) async {
    try {
      // Ambil gambar dan unggah ke Firebase Storage, dapatkan URL-nya
      final imageUrl = await uploadImageAndGetUrl();
      if (imageUrl == null) return;

      // Panggil fungsi untuk menganalisis gambar dan mendapatkan label fitur
      final labels = await visionService.analyzeImage(imageUrl);

      if (labels.isEmpty) {
        Get.snackbar(
          'Tidak Ditemukan',
          'Tidak ada barang yang sesuai dengan gambar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }

      // Filter barang berdasarkan hasil label dari analisis gambar
      var matchedItems = transaksiController.items.where((item) {
        return labels.any((label) => item.namaBarang.toLowerCase().contains(label.toLowerCase()));
      }).toList();

      if (matchedItems.isEmpty) {
        Get.snackbar(
          'Tidak Ditemukan',
          'Tidak ada barang yang sesuai dengan gambar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }

      // Tampilkan barang yang ditemukan ke pengguna
      showSearchResults(context, matchedItems);

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Menampilkan hasil pencarian ke pengguna
  void showSearchResults(BuildContext context, List<BarangModel> items) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var barang = items[index];
            return ListTile(
              leading: Image.network(
                barang.fotoUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.red,
                  );
                },
              ),
              title: Text(barang.namaBarang),
              subtitle: Text("Stok: ${barang.stokBarang}"),
              onTap: () {
                // Tambahkan barang yang dipilih ke keranjang atau tindakan lainnya
                transaksiController.addItem(barang.id);
                Navigator.pop(context); // Tutup bottom sheet
              },
            );
          },
        );
      },
    );
  }
}
