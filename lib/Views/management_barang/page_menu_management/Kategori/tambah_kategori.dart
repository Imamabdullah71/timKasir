import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tim_kasir/Controllers/Kategori_Controller/page_kategori_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

// ignore: use_key_in_widget_constructors
class TambahKategoriPage extends GetView<PageKategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Tambah Kategori",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.imageFile.value != null) {
                return Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Image.memory(
                    controller.imageFile.value!,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 100,
                  ),
                );
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.pickImage(ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.namaKategoriC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Nama Kategori...',
                prefixIcon: Icon(
                  BootstrapIcons.grid,
                  color: Colors.grey.shade600,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 114, 94, 225),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 114, 94, 225),
                minimumSize: const Size(
                  70,
                  48,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: () {
                controller.tambahKategori(controller.namaKategoriC.text);
              },
              child: const Text(
                'Tambahkan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
