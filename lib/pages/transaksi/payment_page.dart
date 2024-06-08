// Pages/payment_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

class PaymentPage extends StatelessWidget {
  final TransaksiController transaksiController =
      Get.find<TransaksiController>();

  final RxInt amountGiven = 0.obs;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembayaran"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      amountGiven.value >= transaksiController.totalAmount.value
                          ? Colors.green
                          : Colors.grey,
                ),
                child: IconButton(
                  icon: Icon(Icons.check),
                  onPressed:
                      amountGiven.value >= transaksiController.totalAmount.value
                          ? () {
                              transaksiController
                                  .finalizeTransaction(amountGiven.value);
                              Get.toNamed("/success_transaksi_page");
                            }
                          : null,
                  color: Colors.white,
                ),
              ),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Jumlah Uang",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountGiven.value = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                "Total yang harus dibayar: ${transaksiController.totalAmount.value}")),
            SizedBox(height: 20),
            Obx(() => Text(
                "Kembalian: ${amountGiven.value - transaksiController.totalAmount.value}")),
          ],
        ),
      ),
    );
  }
}
