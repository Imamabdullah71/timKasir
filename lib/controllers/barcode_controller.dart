import 'package:get/get.dart';

class BarcodeController extends GetxController {
  var barcode = ''.obs;

  void setBarcode(String code) {
    barcode.value = code;
  }
}
