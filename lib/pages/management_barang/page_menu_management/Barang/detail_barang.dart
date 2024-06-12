// detail_barang.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/page_barang_controller.dart';

// ignore: use_key_in_widget_constructors
class DetailBarangPage extends StatelessWidget {
  final PageBarangController pageBarangController =
      Get.find<PageBarangController>();

  @override
  Widget build(BuildContext context) {
    final barang = Get.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Detail Barang",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: const Text(
                "Stok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<String>(
        future: pageBarangController.getKategoriNama(barang['kategori_id']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Kategori tidak ditemukan"));
          }

          final namaKategori = snapshot.data ?? 'Tidak diketahui';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
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
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child:
                          Text("Nama Barang", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text("${barang['nama_barang']}",
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child:
                          Text("Kode Barang", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text("${barang['kode_barang']}",
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text("Harga Beli", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text("${barang['harga_beli']}",
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text("Harga Jual", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text("${barang['harga_jual']}",
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text("Stok", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text("${barang['stok_barang']} item",
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text("Kategori", style: TextStyle(fontSize: 18)),
                    ),
                    const Text(": ", style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Text(namaKategori,
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(
                    double.infinity, // Lebar
                    48, // Tinggi
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                onPressed: () {
                  pageBarangController.hapusBarang(barang['id']);
                },
                child: const Text(
                  "Hapus",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(
                    double.infinity, // Lebar
                    48, // Tinggi
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                onPressed: () {
                  Get.toNamed("/edit_page_barang", arguments: barang);
                },
                child: const Text(
                  "Edit Barang",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
