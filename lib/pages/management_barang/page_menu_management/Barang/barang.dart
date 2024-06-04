import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';

class PageBarang extends GetView<PageBarangController> {
  @override
  Widget build(BuildContext context) {
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
          "Daftar Barang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Wrap(
                spacing: 8.0,
                children: controller.kategoriList.map((kategori) {
                  return FilterChip(
                    label: Text(kategori['nama_kategori']),
                    selected:
                        controller.selectedCategories.contains(kategori['id']),
                    onSelected: (bool selected) {
                      controller.toggleCategorySelection(kategori['id']);
                    },
                  );
                }).toList(),
              );
            }),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.filteredBarangList.isEmpty) {
                  return Center(child: Text('Tidak ada barang.'));
                } else {
                  return ListView.builder(
                    itemCount: controller.filteredBarangList.length,
                    itemBuilder: (context, index) {
                      var barang = controller.filteredBarangList[index];
                      return ListTile(
                        title: Text(barang['nama_barang']),
                        subtitle: Text('Harga: ${barang['harga_barang']}'),
                        onTap: () {
                          Get.toNamed("/detail_page_barang", arguments: barang);
                        },
                        trailing: IconButton(
                            onPressed: () {
                              controller.hapusBarang(barang['id']);
                            },
                            icon: Icon(
                              BootstrapIcons.trash,
                              color: Colors.red,
                            )),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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
              Get.toNamed("/uplaod_page_barang");
            },
            child: Text(
              "Tambah Barang",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
