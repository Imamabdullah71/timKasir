import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/edit_barang_controller.dart';

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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
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
              decoration: InputDecoration(labelText: 'Nama Barang'),
              controller: controller.namaBarangController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga Barang'),
              keyboardType: TextInputType.number,
              controller: controller.hargaBarangController,
            ),
            Obx(() {
              return DropdownSearch<String>(
                items: controller.kategoriList
                    .map((kategori) => kategori['nama_kategori'] as String)
                    .toList(),
                selectedItem: controller.selectedKategori.value,
                dropdownDecoratorProps: DropDownDecoratorProps(
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
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                ),
              );
            }),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              minimumSize: Size(
                double.infinity, // Lebar
                48, // Tinggi
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {
              controller.editBarang(barang['id']);
            },
            child: Text(
              "Simpan Perubahan",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
