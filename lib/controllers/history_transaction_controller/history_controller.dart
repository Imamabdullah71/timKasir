// history_controller.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/models/transaksi_model.dart';

class HistoryController extends GetxController {
  // List untuk menyimpan data transaksi
  final transaksiList = <TransaksiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil fungsi untuk membaca data saat controller diinisialisasi
    fetchTransaksi();
  }

  void fetchTransaksi() {
    // Stream untuk mengambil data transaksi dari Firestore secara real-time
    FirebaseFirestore.instance
        .collection('transaksi')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      // Clear list transaksi sebelum update
      transaksiList.clear();
      
      // Update list transaksi dengan data baru dari Firestore
      for (var doc in snapshot.docs) {
        transaksiList.add(TransaksiModel.fromFirestore(doc));
      }
    });
  }
}
