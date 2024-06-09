import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class PaymentController extends GetxController {
  final RxInt amountGiven = 0.obs;
  final TextEditingController amountController = TextEditingController();

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
      amountController.text =
          amountController.text.substring(0, amountController.text.length - 1);
      amountGiven.value = int.tryParse(amountController.text) ?? 0;
    }
  }

  void onConfirmTap(double totalAmount) {
    if (amountGiven.value >= totalAmount.toInt()) {
      // Add your transaction finalizing logic here
      Get.toNamed("/success_transaksi_page");
    }
  }

  String formatNumber(double number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number.toInt()).replaceAll(',', '.');
  }
}
