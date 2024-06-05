import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'dart:io';
import 'dart:typed_data'; // Pastikan untuk mengimpor ini

class ImageController extends GetxController {
  var imageFile = Rx<Uint8List?>(null);
  var croppedImageFile = Rx<Uint8List?>(null);

  final CropController cropController = CropController();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = await pickedFile.readAsBytes();
    }
  }

  void cropImage() {
    if (imageFile.value != null) {
      cropController.crop();
    }
  }

  Future<void> uploadImageToFirebase() async {
    if (croppedImageFile.value != null) {
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('images/${DateTime.now().toString()}.jpg');
        await storageRef.putData(croppedImageFile.value!);
        final imageUrl = await storageRef.getDownloadURL();
        print("Image uploaded to Firebase: $imageUrl");
        Get.snackbar("Berhasil", "");
      } catch (e) {
        print("Error uploading image: $e");
      }
    } else {
      print("No image selected.");
    }
  }
}
