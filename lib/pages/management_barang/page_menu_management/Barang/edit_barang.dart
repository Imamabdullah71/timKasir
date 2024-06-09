import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/edit_barang_controller.dart';

// ignore: use_key_in_widget_constructors
class EditBarangPage extends StatelessWidget {
  final EditBarangController controller = Get.put(EditBarangController());

  @override
  Widget build(BuildContext context) {
    final barang = Get.arguments as Map<String, dynamic>;
    controller.setInitialValues(barang);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Edit Barang",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nama Barang'),
              controller: controller.namaBarangController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Harga Barang'),
              keyboardType: TextInputType.number,
              controller: controller.hargaBarangController,
            ),
            Obx(() {
              return DropdownSearch<String>(
                items: controller.kategoriList
                    .map((kategori) => kategori['nama_kategori'] as String)
                    .toList(),
                selectedItem: controller.selectedKategori.value,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Pilih Kategori",
                  ),
                ),
                onChanged: (value) {
                  var selectedKategori = controller.kategoriList.firstWhere(
                      (kategori) => kategori['nama_kategori'] == value);
                  controller.setKategori(selectedKategori['nama_kategori'],
                      selectedKategori['id']);
                },
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              minimumSize: const Size(
                double.infinity, // Lebar
                48, // Tinggi
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {
              controller.editBarang(barang['id']);
            },
            child: const Text(
              "Simpan Perubahan",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
