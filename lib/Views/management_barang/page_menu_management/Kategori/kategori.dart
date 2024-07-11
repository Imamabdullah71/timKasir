import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:tim_kasir/Controllers/Kategori_Controller/page_kategori_controller.dart';
// import 'dart:typed_data';

class KategoriPage extends GetView<PageKategoriController> {
  KategoriPage({super.key});
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
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
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
                leading: kategoriData['foto_url'] != null &&
                        kategoriData['foto_url'].isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          kategoriData['foto_url'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                title: Text(kategoriData["nama_kategori"]),
                onTap: () {
                  kategoriController.namaKategoriC.text =
                      kategoriData["nama_kategori"] ?? "";
                  kategoriController.imageFile.value =
                      null; // Reset image file before editing

                  Get.dialog(
                    AlertDialog(
                      title: const Center(child: Text('Edit Kategori')),
                      content: FutureBuilder<DocumentSnapshot<Object?>>(
                        future: controller.getKategoriData(kategoriIndex.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              var kategoriData =
                                  snapshot.data!.data() as Map<String, dynamic>;

                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 10),
                                    // Display current or new selected image
                                    Obx(
                                      () => kategoriController
                                                  .imageFile.value !=
                                              null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.memory(
                                                kategoriController
                                                    .imageFile.value!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : kategoriData['foto_url'] != null &&
                                                  kategoriData['foto_url']
                                                      .isNotEmpty
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    kategoriData['foto_url'],
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.grey,
                                                    size: 50,
                                                  ),
                                                ),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton.icon(
                                      onPressed: () => kategoriController
                                          .pickImage(ImageSource.gallery),
                                      icon: const Icon(BootstrapIcons.image),
                                      label: const Text('Pilih Gambar'),
                                    ),
                                    const SizedBox(height: 10),
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
                                              Radius.circular(30)),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 114, 94, 225),
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
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text("Data kategori tidak ditemukan."),
                              );
                            }
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: Center(
                              child: Text("Loading..."),
                            ));
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
                              backgroundColor:
                                  const Color.fromARGB(255, 114, 94, 225),
                              minimumSize:
                                  const Size(70, 48), // Lebar dan Tinggi
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                            onPressed: () async {
                              var updatedNamaKategori =
                                  kategoriController.namaKategoriC.text;
                              var docId = kategoriIndex.id;

                              // Update nama kategori dan foto_url jika gambar baru dipilih
                              if (kategoriController.imageFile.value != null) {
                                // Upload new image and get URL
                                String? newImageUrl =
                                    await kategoriController.uploadImage(docId);
                                if (newImageUrl != null) {
                                  kategoriController.updateKategoriWithImage(
                                      updatedNamaKategori, docId, newImageUrl);
                                }
                              } else {
                                // Only update nama kategori
                                kategoriController.updateKategori(
                                    updatedNamaKategori, docId);
                              }
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
            backgroundColor: const Color.fromARGB(255, 114, 94, 225),
            minimumSize: const Size(double.infinity, 48), // Lebar dan Tinggi
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
          ),
        ),
      ),
    );
  }
}
