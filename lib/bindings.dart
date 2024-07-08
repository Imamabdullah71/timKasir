import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/Barang_Controller/edit_barang_controller.dart';
import 'package:tim_kasir/Controllers/Barang_Controller/tambah_barang_controller.dart';
import 'package:tim_kasir/Controllers/Barang_Controller/page_barang_controller.dart';
import 'package:tim_kasir/Controllers/Kategori_Controller/page_kategori_controller.dart';
import 'package:tim_kasir/Controllers/Laporan_Controller/laporan_controller.dart';
import 'package:tim_kasir/Controllers/Stok_Controller/page_stok_controller.dart';
import 'package:tim_kasir/Controllers/Supplier_Controller/supplier_page_controller.dart';
import 'package:tim_kasir/Controllers/Transaksi/image_search_controller.dart';
import 'package:tim_kasir/Controllers/Transaksi/payment_controller.dart';
import 'package:tim_kasir/Controllers/Transaksi/transaksi_controller.dart';
import 'package:tim_kasir/Controllers/bottom_bar_controller.dart';
import 'package:tim_kasir/Controllers/history_transaction_controller/history_controller.dart';
import 'package:tim_kasir/Controllers/home_controller.dart';

class TambahDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BottomBarController>(() => BottomBarController());

    // Barang
    Get.lazyPut<TambahBarangController>(() => TambahBarangController());
    Get.lazyPut<PageBarangController>(() => PageBarangController());
    Get.lazyPut<EditBarangController>(() => EditBarangController());
    // Kategori
    Get.lazyPut<PageKategoriController>(() => PageKategoriController());
    // Transaksi
    Get.lazyPut<TransaksiController>(() => TransaksiController());
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<ImageSearchController>(() => ImageSearchController());
    // Histori Transaksi
    Get.lazyPut<HistoryController>(() => HistoryController());
    // Stok Barang
    Get.lazyPut<PageStokController>(() => PageStokController());
    // Supplier
    Get.lazyPut<SupplierController>(() => SupplierController());
    // Laporan
    Get.lazyPut<LaporanController>(() => LaporanController());
  }
}
