import 'dart:io';

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class UploadController extends GetxController {
  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    } else {
      print("Membatalkan file upload");
      Get.snackbar("Membatalkan file upload", "File Upload dibatalkan.");
    }
  }
}
