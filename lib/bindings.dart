import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/edit_barang_controller.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/tambah_barang_controller.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';
import 'package:timkasirapp/Controllers/Kategori_Controller/page_kategori_controller.dart';
import 'package:timkasirapp/Filter_Test/Query_Controller.dart';
import 'package:timkasirapp/Controllers/produk_controller/add_product_controller.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';
import 'package:timkasirapp/Controllers/produk_controller/edit_product_controller.dart';
import 'package:timkasirapp/upload_file/upload_controller.dart';

class TambahDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(() => AddProductController());
    Get.lazyPut<EditProductController>(() => EditProductController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<QueryController>(() => QueryController());
    Get.lazyPut<UploadController>(() => UploadController());
    //Barang
    Get.lazyPut<TambahBarangController>(() => TambahBarangController());
    Get.lazyPut<PageBarangController>(() => PageBarangController());
    Get.lazyPut<EditBarangController>(() => EditBarangController());
    //Kategori
    Get.lazyPut<PageKategoriController>(() => PageKategoriController());
  }
}
