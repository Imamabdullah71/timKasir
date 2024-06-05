import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timkasirapp/1Testing_Image/Image_Controller.dart';

class TestingImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            if (imageController.croppedImageFile.value != null) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: Image.memory(
                  imageController.croppedImageFile.value!,
                  fit: BoxFit.cover,
                ),
              );
            } else if (imageController.imageFile.value != null) {
              return Container(
                height: 200,
                width: 200,
                child: Crop(
                  controller: imageController.cropController,
                  image: imageController.imageFile.value!,
                  onCropped: (croppedData) {
                    imageController.croppedImageFile.value = croppedData;
                  },
                ),
              );
            } else {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: Icon(
                  Icons.image_not_supported,
                  size: 60,
                ),
              );
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  imageController.pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  imageController.pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              imageController.cropImage();
            },
            child: Text('Crop Image'),
          ),
          ElevatedButton(
            onPressed: () {
              imageController.uploadImageToFirebase();
            },
            child: Text('Upload gambar'),
          ),
        ],
      ),
    );
  }
}
