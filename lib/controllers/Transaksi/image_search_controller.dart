// image_search_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timkasirapp/Models/barang_model.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

class ImageSearchController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final TransaksiController transaksiController = Get.find<TransaksiController>();

  // Fungsi untuk mengambil gambar menggunakan kamera
  Future<void> searchByImage(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo == null) {
      Get.snackbar(
        'Gagal',
        'Tidak ada gambar yang diambil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Disini seharusnya ada logika untuk mengirim gambar ke server atau menggunakan model lokal untuk mendapatkan barang yang serupa.
    // Simulasikan hasil pencarian gambar dengan mencari barang dengan nama yang cocok.
    // Ini bisa digantikan dengan logika sebenarnya berdasarkan layanan eksternal atau model ML.

    String simulatedQuery = 'barang'; // Ubah ini menjadi hasil dari model pencarian gambar.
    
    // Filter barang berdasarkan hasil pencarian
    var matchedItems = transaksiController.items.where((item) {
      return item.namaBarang.toLowerCase().contains(simulatedQuery.toLowerCase());
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
