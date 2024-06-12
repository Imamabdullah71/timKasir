import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';

class PaymentController extends GetxController {
  final RxInt amountGiven = 0.obs;
  final TextEditingController amountController = TextEditingController();
  final TransaksiController transaksiController = Get.find<TransaksiController>();

  void onNumberTap(int number) {
    if (number == -1) {
      amountController.text += "000";
    } else {
      amountController.text += number.toString();
    }
    amountGiven.value = int.tryParse(amountController.text) ?? 0;
  }

  void onClearTap() {
    amountController.clear();
    amountGiven.value = 0;
  }

  void onBackspaceTap() {
    if (amountController.text.isNotEmpty) {
      amountController.text = amountController.text.substring(0, amountController.text.length - 1);
      amountGiven.value = int.tryParse(amountController.text) ?? 0;
    }
  }

  void onConfirmTap(double totalAmount) {
    if (amountGiven.value >= totalAmount.toInt()) {
      print("onConfirmTap called with amountGiven: ${amountGiven.value}, totalAmount: $totalAmount");
      transaksiController.finalizeTransaction(amountGiven.value);
      Get.toNamed("/success_transaksi_page");
    } else {
      print("onConfirmTap: amountGiven is less than totalAmount");
    }
  }

  String formatNumber(double number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number.toInt()).replaceAll(',', '.');
  }
}
