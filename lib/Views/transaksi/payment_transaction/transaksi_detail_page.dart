import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/Transaksi/payment_controller.dart';
import 'package:tim_kasir/Controllers/Transaksi/transaksi_controller.dart';
import 'package:tim_kasir/Controllers/bottom_bar_controller.dart';
import 'package:tim_kasir/bottom_bar.dart';

// ignore: use_key_in_widget_constructors
class TransaksiDetailPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.find<TransaksiController>();
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Detail Transaksi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
        actions: [
          IconButton(
            onPressed: () {
              final BottomBarController bottomBarController =
                  Get.find<BottomBarController>();
              bottomBarController.resetToHome();

              // Gunakan Navigator untuk berpindah ke halaman utama
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        BottomBar()), // Pastikan BottomBar adalah halaman utama
                (Route<dynamic> route) => false, // Hapus semua route sebelumnya
              );
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: Obx(() {
        var selectedItems = transaksiController.itemCounts.entries.toList();

        if (selectedItems.isEmpty) {
          return const Center(child: Text("No items selected"));
        }

        return ListView.builder(
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            var itemId = selectedItems[index].key;
            var quantity = selectedItems[index].value;
            var item = transaksiController.items
                .firstWhere((item) => item.id == itemId);

            return ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.fotoUrl,
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
              title: Text(item.namaBarang),
              subtitle: Text(
                  "$quantity × ${paymentController.formatNumber(item.hargaJual ?? 0.0)}"),
              trailing: Text(
                  "Total: ${paymentController.formatNumber((item.hargaJual ?? 0.0) * quantity)}"),
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text("Ubah Jumlah Barang"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                transaksiController.removeItem(item.id);
                              },
                              icon: const Icon(Icons.remove),
                              color: Colors.red,
                            ),
                            Obx(() {
                              var currentQuantity =
                                  transaksiController.itemCounts[item.id] ?? 0;
                              return Text("$currentQuantity");
                            }),
                            IconButton(
                              onPressed: () {
                                transaksiController.addItem(item.id);
                              },
                              icon: const Icon(Icons.add),
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  transaksiController.deleteItem(item.id),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        return Container(
          width: double.infinity,
          height: 55,
          margin: const EdgeInsets.only(left: 35),
          child: FloatingActionButton.extended(
            onPressed: () => Get.toNamed("/payment_page"),
            label: Text(
              "Bayar (${paymentController.formatNumber(transaksiController.totalAmount.value)})",
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 114, 94, 225),
          ),
        );
      }),
    );
  }
}
