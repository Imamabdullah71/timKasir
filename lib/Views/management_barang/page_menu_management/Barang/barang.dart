import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:tim_kasir/Controllers/Barang_Controller/page_barang_controller.dart';

class PageBarang extends GetView<PageBarangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Daftar Barang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pilih Urutan'),
                          content: DropdownSearch<String>(
                            items: const [
                              'Nama A - Z',
                              'Nama Z - A',
                              'Baru ditambahkan',
                              'Terlama ditambahkan'
                            ],
                            selectedItem: controller.sortOrder.value == 'A-Z'
                                ? 'Nama A - Z'
                                : 'Nama Z - A',
                            onChanged: (value) {
                              if (value == 'Nama A - Z') {
                                controller.setSortOrder('A-Z');
                              } else if (value == 'Nama Z - A') {
                                controller.setSortOrder('Z-A');
                              }
                              Get.back();
                            },
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.filter_list),
                ),
                Expanded(
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
                          color: Color.fromARGB(255, 114, 94, 225),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pilih Kategori'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1,
                                      ),
                                      itemCount: controller.kategoriList.length,
                                      itemBuilder: (context, index) {
                                        var kategori =
                                            controller.kategoriList[index];
                                        var isSelected = controller
                                            .selectedCategories
                                            .contains(kategori['id']);
                                        return GestureDetector(
                                          onTap: () {
                                            controller.toggleCategorySelection(
                                                kategori['id']);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: isSelected
                                                    ? Colors.purple
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                // Image as background
                                                Positioned.fill(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child: kategori['foto_url'] !=
                                                                null &&
                                                            kategori['foto_url']
                                                                .isNotEmpty
                                                        ? Image.network(
                                                            kategori[
                                                                'foto_url'],
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Container(
                                                            color: Colors
                                                                .grey[300],
                                                            child: const Icon(
                                                              Icons
                                                                  .image_not_supported,
                                                              size: 50,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                // Overlay for selection
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Colors.purple
                                                              .withOpacity(0.3)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                                // Centered Text
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? Colors.purple
                                                              .withOpacity(0.7)
                                                          : Colors.black
                                                              .withOpacity(0.5),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      kategori['nama_kategori'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Selesai"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    BootstrapIcons.ui_checks_grid,
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
                              ? Colors.transparent
                              : const Color.fromARGB(255, 114, 94, 225),
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

                      // Ambil dan format harga
                      // Di dalam ListTile, gunakan metode formatNumber dari controller
                      var hargaBeli = barang['harga_beli'] != null
                          ? controller
                              .formatNumber(barang['harga_beli'].toDouble())
                          : 'Harga beli tidak tersedia';
                      var hargaJual = barang['harga_jual'] != null
                          ? controller
                              .formatNumber(barang['harga_jual'].toDouble())
                          : 'Harga jual tidak tersedia';

                      var kodeBarang =
                          barang['kode_barang'] ?? 'Kode barang tidak tersedia';

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
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$kodeBarang'),
                            Text('  Harga Beli: Rp $hargaBeli'),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "Stok: ${barang['stok_barang']}",
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Rp $hargaJual",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
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
              backgroundColor: const Color.fromARGB(255, 114, 94, 225),
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
            ),),
      ),
    );
  }
}
