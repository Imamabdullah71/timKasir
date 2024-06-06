import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';

class PageBarang extends GetView<PageBarangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: barang['foto_url'] != null &&
                                  barang['foto_url'].isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    barang['foto_url'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.broken_image,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                )
                              : Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                        ),
                        title: Text(barang['nama_barang']),
                        subtitle: Text('Harga: ${barang['harga_jual']}'),
                        onTap: () {
                          Get.toNamed("/detail_page_barang", arguments: barang);
                        },
                        trailing: Container(
                          child: Text(
                            "x1",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
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
              Get.toNamed("/upload_page_barang");
            },
            child: Text(
              "Tambah Barang",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}