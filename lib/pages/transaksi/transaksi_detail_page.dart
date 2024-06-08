import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

class TransaksiDetailPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.find<TransaksiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Obx(() {
        var selectedItems = transaksiController.itemCounts.entries.toList();

        if (selectedItems.isEmpty) {
          return Center(child: Text("No items selected"));
        }

        return ListView.builder(
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            var itemId = selectedItems[index].key;
            var quantity = selectedItems[index].value;
            var item = transaksiController.items
                .firstWhere((item) => item.id == itemId);

            return ListTile(
              leading: Container(
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
                      return Icon(
                        Icons.broken_image,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              title: Text(item.namaBarang),
              subtitle: Text("×$quantity"),
              trailing: Text("Total: ${(item.hargaJual ?? 0.0) * quantity}"),
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: Text("Ubah Jumlah"),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            transaksiController.removeItem(item.id);
                          },
                          icon: Icon(Icons.remove),
                          color: Colors.red,
                        ),
                        Obx(() {
                          var currentQuantity = transaksiController.itemCounts[item.id] ?? 0;
                          return Text("$currentQuantity");
                        }),
                        IconButton(
                          onPressed: () {
                            transaksiController.addItem(item.id);
                          },
                          icon: Icon(Icons.add),
                          color: Colors.green,
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
        return FloatingActionButton.extended(
          onPressed: () => Get.toNamed("/payment_page"),
          label: Text(
            "Lanjut Bayar (${transaksiController.totalAmount.value})",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        );
      }),
    );
  }
}
