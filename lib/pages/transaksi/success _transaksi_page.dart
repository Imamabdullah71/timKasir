// Pages/success_transaksi_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

// ignore: use_key_in_widget_constructors
class SuccessTransaksiPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.find<TransaksiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Transaksi Sukses",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Transaksi berhasil!"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },
              child: const Text("Transaksi Kembali"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
                Get.back();
              },
              child: const Text("Halaman Utama"),
            ),
          ],
        ),
      ),
    );
  }
}
