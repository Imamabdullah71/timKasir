import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:tim_kasir/Controllers/Laporan_Controller/laporan_controller.dart';

// ignore: use_key_in_widget_constructors
class LaporanPage extends StatelessWidget {
  final LaporanController laporanController = Get.find<LaporanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Laporan Laba Rugi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Rentang Waktu Laporan:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownSearch<String>(
              items: const [
                'Laporan Hari ini',
                'Laporan Minggu ini',
                'Laporan Bulan ini',
                'Laporan Tahun ini',
                'Laporan Semuanya',
              ],
              selectedItem: laporanController.selectedRange.value,
              onChanged: (value) {
                if (value != null) {
                  // print('Selected range: $value'); // Debugging log
                  laporanController.updateLaporan(value);
                }
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (laporanController.totalPemasukan.value == 0 &&
                  laporanController.totalPengeluaran.value == 0 &&
                  laporanController.labaBersih.value == 0) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Pemasukan: Rp ${laporanController.formatNumber(laporanController.totalPemasukan.value)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total Pengeluaran: Rp ${laporanController.formatNumber(laporanController.totalPengeluaran.value)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Laba Bersih: Rp ${laporanController.formatNumber(laporanController.labaBersih.value)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
