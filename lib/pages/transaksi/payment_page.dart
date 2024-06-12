import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';
import 'package:timkasirapp/Controllers/Transaksi/payment_controller.dart'; // Import controller baru

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
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Pembayaran",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              buttonSize: 70, // Set ukuran tombol
              buttonColor: Colors.blue[100]!, // Set warna latar belakang tombol
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  "Total yang harus dibayar: Rp ${paymentController.formatNumber(transaksiController.totalAmount.value)}",
                  style: const TextStyle(fontSize: 20),
                )),
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
  final double buttonSize; // Tambahkan parameter ukuran tombol
  final Color buttonColor; // Tambahkan parameter warna tombol

  const NumPad({
    super.key,
    required this.onNumberTap,
    required this.onClearTap,
    required this.onBackspaceTap,
    this.buttonSize = 60.0, // Default ukuran tombol
    this.buttonColor =
        const Color(0xFFE0E0E0), // Default warna latar belakang tombol
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow([-2, -3]),
        buildRow([7, 8, 9]),
        buildRow([4, 5, 6]),
        buildRow([1, 2, 3]),
        buildRow([
          -1,
          -4,
          0
        ]), // -1 for '000', -2 for 'C', -3 for backspace, -4 for '00'
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
                    ? buildButtonIcon(Icons.backspace,
                        onBackspaceTap) // Gunakan ikon untuk backspace
                    : number == -4
                        ? buildButton("00", () => onNumberTap(00))
                        : buildButton(
                            number.toString(), () => onNumberTap(number));
      }).toList(),
    );
  }

  Widget buildButton(String label, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: buttonSize, // Gunakan ukuran tombol yang ditentukan
          height: buttonSize, // Gunakan ukuran tombol yang ditentukan
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor, // Gunakan warna tombol yang ditentukan
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
          width: buttonSize, // Gunakan ukuran tombol yang ditentukan
          height: buttonSize, // Gunakan ukuran tombol yang ditentukan
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor, // Gunakan warna tombol yang ditentukan
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
