import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/controllers/produk_controller.dart/add_product_controller.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class TambahDataPage extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Data Produk",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Nama Produk...',
                prefixIcon: Icon(
                  BootstrapIcons.box_seam,
                  color: Colors.grey.shade600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ), // Warna border saat fokus
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ), // Change border color here
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.priceC,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Harga...',
                prefixIcon: Icon(
                  BootstrapIcons.cash,
                  color: Colors.grey.shade600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ), // Warna border saat fokus
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ), // Change border color here
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                minimumSize: Size(
                  70, // Lebar
                  48, // Tinggi
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: () {
                controller.addProduct(
                    controller.nameC.text, controller.priceC.text);
              },
              child: Text(
                'Tambah Produk',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
