import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/tambah_barang_controller.dart';

class ImageEditorPage extends StatelessWidget {
  final TambahBarangController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Gambar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              controller.cropImage();
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (controller.imageFile.value != null) {
            return Crop(
              controller: controller.cropController,
              image: controller.imageFile.value!,
              onCropped: (croppedData) {
                controller.croppedImageFile.value = croppedData;
              },
            );
          } else {
            return const Text('Tidak ada gambar yang dipilih');
          }
        }),
      ),
    );
  }
}
