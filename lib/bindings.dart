import 'package:get/get.dart';
import 'package:timkasirapp/controllers/infaq_controller.dart';
import 'package:timkasirapp/controllers/produk_controller.dart/add_product_controller.dart';
import 'package:timkasirapp/controllers/home_controller.dart';
import 'package:timkasirapp/controllers/produk_controller.dart/edit_product_controller.dart';

class TambahDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(() => AddProductController());
    Get.lazyPut<EditProductController>(() => EditProductController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<InfaqController>(() => InfaqController());
  }
}
