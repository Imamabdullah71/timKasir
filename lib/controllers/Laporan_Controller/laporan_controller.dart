import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanController extends GetxController {
  final RxString selectedRange = 'Laporan Semuanya'.obs;
  final RxDouble totalPemasukan = 0.0.obs;
  final RxDouble totalPengeluaran = 0.0.obs;
  final RxDouble labaBersih = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLaporan();
  }

  void fetchLaporan() async {
    QuerySnapshot querySnapshot;

    // print('Fetching data for: ${selectedRange.value}'); // Debugging log

    switch (selectedRange.value) {
      case 'Laporan Hari ini':
        var startOfDay = DateTime.now().toLocal().startOfDay();
        querySnapshot = await FirebaseFirestore.instance
            .collection('transaksi')
            .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
            .get();
        break;
      case 'Laporan Minggu ini':
        var startOfWeek = DateTime.now().toLocal().startOfWeek();
        querySnapshot = await FirebaseFirestore.instance
            .collection('transaksi')
            .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
            .get();
        break;
      case 'Laporan Bulan ini':
        var startOfMonth = DateTime.now().toLocal().startOfMonth();
        querySnapshot = await FirebaseFirestore.instance
            .collection('transaksi')
            .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfMonth))
            .get();
        break;
      case 'Laporan Tahun ini':
        var startOfYear = DateTime.now().toLocal().startOfYear();
        querySnapshot = await FirebaseFirestore.instance
            .collection('transaksi')
            .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfYear))
            .get();
        break;
      default: // 'Laporan Semuanya'
        querySnapshot = await FirebaseFirestore.instance.collection('transaksi').get();
        break;
    }

    calculateTotals(querySnapshot.docs);
  }

  void calculateTotals(List<QueryDocumentSnapshot> transactions) {
    double pemasukan = 0.0;
    double pengeluaran = 0.0;

    // print('Calculating totals for ${transactions.length} transactionx`s'); // Debugging log

    for (var doc in transactions) {
      var data = doc.data() as Map<String, dynamic>;
      pemasukan += data['total_harga'] ?? 0.0;
      pengeluaran += data['total_harga_beli'] ?? 0.0;
    }

    totalPemasukan.value = pemasukan;
    totalPengeluaran.value = pengeluaran;
    labaBersih.value = pemasukan - pengeluaran;

    // print('Updated totals:'); // Debugging log
    // print('Total Pemasukan: $totalPemasukan'); // Debugging log
    // print('Total Pengeluaran: $totalPengeluaran'); // Debugging log
    // print('Laba Bersih: $labaBersih'); // Debugging log
  }

  void updateLaporan(String range) {
    selectedRange.value = range;
    fetchLaporan();
  }

  String formatNumber(double number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number.toInt()).replaceAll(',', '.');
  }
}

extension DateHelpers on DateTime {
  DateTime startOfDay() => DateTime(year, month, day);
  DateTime startOfWeek() => subtract(Duration(days: weekday - 1)).startOfDay();
  DateTime startOfMonth() => DateTime(year, month);
  DateTime startOfYear() => DateTime(year);
}
