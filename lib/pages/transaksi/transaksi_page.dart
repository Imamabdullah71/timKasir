import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/payment_controller.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

class TransaksiPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.find<TransaksiController>();
  final PaymentController paymentController = Get.find<PaymentController>();

  // TextEditingController untuk menangani teks di Search Bar
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Transaksi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
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
              onChanged: (value) {
                // Set query pencarian ke controller
                transaksiController.searchQuery.value = value;
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              var barangList = transaksiController.filteredItems;

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
                      return Text(
                        selectedQuantity == 0 ? "" : "x $selectedQuantity",
                        style: const TextStyle(fontSize: 20),
                      );
                    }),
                    onTap: () {
                      transaksiController.addItem(barang.id);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Obx(() {
        return Container(
          width: double.infinity,
          height: 55,
          margin: const EdgeInsets.only(left: 35),
          child: FloatingActionButton.extended(
            onPressed: transaksiController.itemCounts.isNotEmpty
                ? () => Get.toNamed("/transaksi_detail")
                : null,
            label: Text(
              "Bayar (${paymentController.formatNumber(transaksiController.totalAmount.value)})",
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: transaksiController.itemCounts.isNotEmpty
                ? Colors.purple
                : Colors.grey,
          ),
        );
      }),
    );
  }
}
