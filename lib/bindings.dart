import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/edit_barang_controller.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/tambah_barang_controller.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';
import 'package:timkasirapp/Controllers/Kategori_Controller/page_kategori_controller.dart';
import 'package:timkasirapp/Controllers/Transaksi/payment_controller.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';

class TambahDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // Barang
    Get.lazyPut<TambahBarangController>(() => TambahBarangController());
    Get.lazyPut<PageBarangController>(() => PageBarangController());
    Get.lazyPut<EditBarangController>(() => EditBarangController());
    // Kategori
    Get.lazyPut<PageKategoriController>(() => PageKategoriController());
    // Transaksi
    Get.lazyPut<TransaksiController>(() => TransaksiController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
