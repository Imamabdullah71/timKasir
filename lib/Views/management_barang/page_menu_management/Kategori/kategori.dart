import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/Kategori_Controller/page_kategori_controller.dart';

// ignore: use_key_in_widget_constructors
class KategoriPage extends GetView<PageKategoriController> {
  final PageKategoriController kategoriController =
      Get.find<PageKategoriController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Daftar Kategori",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: kategoriController.kategoriCollection,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Tidak ada kategori"));
          }

          var kategoriDoc = snapshot.data!.docs;

          return ListView.builder(
            itemCount: kategoriDoc.length,
            itemBuilder: (context, index) {
              var kategoriIndex = kategoriDoc[index];
              var kategoriData = kategoriIndex.data() as Map<String, dynamic>;
              return ListTile(
                onTap: () {
                  kategoriController.namaKategoriC.text =
                      kategoriData["nama_kategori"] ?? "";
                  Get.dialog(
                    AlertDialog(
                      title: const Center(child: Text('Edit Kategori')),
                      content: FutureBuilder<DocumentSnapshot<Object?>>(
                        future: controller.getKategoriData(kategoriIndex.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: controller.namaKategoriC,
                                    autocorrect: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: 'Nama Kategori...',
                                      prefixIcon: Icon(
                                        BootstrapIcons.box_seam,
                                        color: Colors.grey.shade600,
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                          color: Colors.purple,
                                        ), // Warna border saat fokus
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade500,
                                        ), // Change border color here
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: Text("Data kategori tidak ditemukan."),
                              );
                            }
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return const Center(
                              child:
                                  Text("Terjadi kesalahan saat memuat data."),
                            );
                          }
                        },
                      ),
                      actions: [
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              minimumSize: const Size(
                                70, // Lebar
                                48, // Tinggi
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                            onPressed: () {
                              kategoriController.updateKategori(
                                kategoriController.namaKategoriC.text,
                                kategoriIndex.id,
                              );
                            },
                            child: const Text(
                              "Ubah",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                title: Text(kategoriData["nama_kategori"]),
                trailing: IconButton(
                  onPressed: () {
                    controller.hapusKategori(kategoriIndex.id);
                  },
                  icon: const Icon(
                    BootstrapIcons.trash,
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        },
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
              Get.toNamed("/tambah_kategori_page");
            },
            child: const Text(
              "Tambah Kategori",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )),
      ),
    );
  }
}
