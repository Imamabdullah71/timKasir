import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/controllers/produk_controller.dart/add_product_controller.dart';
import 'package:timkasirapp/controllers/produk_controller.dart/edit_product_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class EditDataPage extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Data Produk",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var dataProduk = snapshot.data!.data() as Map<String, dynamic>;
              controller.nameC.text = dataProduk["name"];
              controller.priceC.text = dataProduk["price"];

              return Padding(
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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                      onPressed: () {
                        controller.addProduct(
                          controller.nameC.text,
                          controller.priceC.text,
                          Get.arguments,
                        );
                      },
                      child: Text(
                        'Edit Produk',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Data produk tidak ditemukan."),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text("Terjadi kesalahan dalam memuat data."),
            );
          }
        },
      ),
    );
  }
}
