// page_barang.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';
import 'package:timkasirapp/Controllers/Transaksi/payment_controller.dart';

// ignore: use_key_in_widget_constructors
class PageBarang extends GetView<PageBarangController> {
  final PaymentController paymentController = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Daftar Barang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
            child: TextField(
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Cari Barang...',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          Obx(() {
            return SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // Mengatur scroll secara horizontal
              child: Row(
                children: controller.kategoriList.map((kategori) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                      selectedColor: Colors.purple[200],
                      label: Text(kategori['nama_kategori']),
                      selected: controller.selectedCategories
                          .contains(kategori['id']),
                      onSelected: (bool selected) {
                        controller.toggleCategorySelection(kategori['id']);
                      },
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: controller.selectedCategories
                                  .contains(kategori['id'])
                              ? Colors
                                  .transparent // Menghilangkan border jika dipilih
                              : Colors
                                  .purple, // Menampilkan border jika tidak dipilih
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
          Expanded(
            child: Obx(
              () {
                if (controller.filteredBarangList.isEmpty) {
                  return const Center(
                      child: Text(
                    'Tidak ada barang.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ));
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
                                      return const Icon(
                                        Icons.broken_image,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                )
                              : const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                        ),
                        title: Text(barang['nama_barang']),
                        subtitle: Text(
                            'Harga: Rp ${paymentController.formatNumber(barang['harga_jual'])}'),
                        onTap: () {
                          Get.toNamed("/detail_page_barang", arguments: barang);
                        },
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
              minimumSize: const Size(
                double.infinity, // Lebar
                48, // Tinggi
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {
              Get.toNamed("/upload_page_barang");
            },
            child: const Text(
              "Tambah Barang",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
