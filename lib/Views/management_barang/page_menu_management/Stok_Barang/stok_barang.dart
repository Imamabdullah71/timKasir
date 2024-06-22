import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tim_kasir/Controllers/Stok_Controller/page_stok_controller.dart';
import 'package:tim_kasir/models/barang_model.dart';

// ignore: use_key_in_widget_constructors
class StokBarangPage extends StatelessWidget {
  final PageStokController controller = Get.find<PageStokController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        centerTitle: true,
        title: const Text(
          'Stok Barang',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('barang').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              BarangModel barang = BarangModel.fromFirestore(documents[index]);
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: barang.fotoUrl.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            barang.fotoUrl,
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
                title: Text(barang.namaBarang),
                subtitle: Text('Stok: ${barang.stokBarang}'),
                onTap: () => controller.showStokDialog(context, barang),
              );
            },
          );
        },
      ),
    );
  }
}
