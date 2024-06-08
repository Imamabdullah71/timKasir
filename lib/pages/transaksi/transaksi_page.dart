import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

// ignore: use_key_in_widget_constructors
class TransaksiPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Obx(() {
        var barangList = transaksiController.items;

        if (barangList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: barangList.length,
          itemBuilder: (context, index) {
            var barang = barangList[index];

            return ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    barang.fotoUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              title: Text(barang.namaBarang),
              subtitle: Text("Stok: ${barang.stokBarang}"),
              trailing: Obx(() {
                var selectedQuantity =
                    transaksiController.itemCounts[barang.id] ?? 0;
                if (selectedQuantity == 0) {
                  return const Text("");
                } else {
                  return Text(
                    "x $selectedQuantity",
                    style: const TextStyle(fontSize: 20),
                  );
                }
              }),
              onTap: () {
                transaksiController.addItem(barang.id);
              },
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          onPressed: transaksiController.itemCounts.isNotEmpty
              ? () => Get.toNamed("/transaksi_detail")
              : null,
          label: Text(
            "Bayar (${transaksiController.totalAmount.value})",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: transaksiController.itemCounts.isNotEmpty
              ? Colors.purple
              : Colors.grey,
        );
      }),
    );
  }
}
