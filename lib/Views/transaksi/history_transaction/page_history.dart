// page_history_transaction.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/history_transaction_controller/history_controller.dart';
import 'package:intl/intl.dart'; // Digunakan untuk format tanggal

// ignore: use_key_in_widget_constructors
class PageHistoryTransaction extends StatelessWidget {
  // Inisialisasi controller
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "History Transaction",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: Obx(
        // Obx akan merender ulang tampilan setiap kali data di controller berubah
        () {
          if (historyController.transaksiList.isEmpty) {
            return const Center(child: Text("Tidak ada data transaksi."));
          }
          return ListView.builder(
            itemCount: historyController.transaksiList.length,
            itemBuilder: (context, index) {
              final transaksi = historyController.transaksiList[index];
              // Format tanggal dari timestamp
              String formattedDate = DateFormat('dd MMM yyyy, HH:mm:ss')
                  .format(transaksi.timestamp.toDate());

              return ListTile(
                // leading:
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Harga',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp ${transaksi.totalHarga.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                subtitle: Text(
                  'Jumlah Barang: ${transaksi.totalBarang}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
