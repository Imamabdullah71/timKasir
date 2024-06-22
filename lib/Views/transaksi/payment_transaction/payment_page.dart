import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/Transaksi/transaksi_controller.dart';
import 'package:tim_kasir/Controllers/Transaksi/payment_controller.dart';

// ignore: use_key_in_widget_constructors
class PaymentPage extends StatelessWidget {
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
          "Pembayaran",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
        actions: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: paymentController.amountGiven.value >=
                          transaksiController.totalAmount.value.toInt()
                      ? Colors.green
                      : Colors.grey,
                ),
                child: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: paymentController.amountGiven.value >=
                          transaksiController.totalAmount.value.toInt()
                      ? () => paymentController
                          .onConfirmTap(transaksiController.totalAmount.value)
                      : null,
                  color: Colors.white,                                 
                ),
              ),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Total yang harus dibayar: Rp ${paymentController.formatNumber(transaksiController.totalAmount.value)}",
                  style: const TextStyle(fontSize: 20),
                )),
            Obx(() => Text(
                  "Rp ${paymentController.formatNumber(paymentController.amountGiven.value.toDouble())}",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            NumPad(
              onNumberTap: paymentController.onNumberTap,
              onClearTap: paymentController.onClearTap,
              onBackspaceTap: paymentController.onBackspaceTap,
              buttonSize: 70,
              buttonColor: Colors.blue[100]!,
            ),
          ],
        ),
      ),
    );
  }
}


class NumPad extends StatelessWidget {
  final Function(int) onNumberTap;
  final Function onClearTap;
  final Function onBackspaceTap;
  final double buttonSize;
  final Color buttonColor;

  const NumPad({
    super.key,
    required this.onNumberTap,
    required this.onClearTap,
    required this.onBackspaceTap,
    this.buttonSize = 60.0,
    this.buttonColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow([-2, -3]),
        buildRow([7, 8, 9]),
        buildRow([4, 5, 6]),
        buildRow([1, 2, 3]),
        buildRow([-1, -4, 0]),
      ],
    );
  }

  Widget buildRow(List<int> numbers) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers.map((number) {
          return number == -1
              ? buildButton("000", () => onNumberTap(number))
              : number == -2
                  ? buildButton("C", onClearTap)
                  : number == -3
                      ? buildButtonIcon(Icons.backspace, onBackspaceTap)
                      : number == -4
                          ? buildButton("00", () => onNumberTap(0))
                          : buildButton(
                              number.toString(), () => onNumberTap(number));
        }).toList());
  }

  Widget buildButton(String label, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget buildButtonIcon(IconData icon, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
