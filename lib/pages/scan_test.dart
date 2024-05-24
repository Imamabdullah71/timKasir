import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../controllers/barcode_controller.dart';

class TestingBarcode extends StatelessWidget {
  final BarcodeController barcodeController = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await scanBarcode();
                  },
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 30,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() => TextField(
                  controller: TextEditingController(
                    text: barcodeController.barcode.value,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kode Barang',
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Warna garis untuk scanning
      'Cancel', // Teks tombol batal
      true, // Apakah harus menampilkan flash kamera
      ScanMode.BARCODE, // Mode scan (BARCODE atau QR)
    );

    if (barcodeScanRes != '-1') {
      barcodeController.setBarcode(barcodeScanRes);
    }
  }
}
