import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/produk_controller/add_product_controller.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class MainHomePage extends StatelessWidget {
  final AddProductController addProductController =
      Get.find<AddProductController>();
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Utama".toUpperCase(),
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: IconButton(
                icon: Icon(BootstrapIcons.house),
                color: Colors.white,
                onPressed: () {
                  Get.offAllNamed("/halaman_utama");
                },
              ),
            ),
          ),
        ],
      ),
      drawer: WidgetDrawer(),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.purple,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            BootstrapIcons.upc_scan,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Scan Test",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed("/transaksi_page");
                          },
                          icon: Icon(
                            BootstrapIcons.cart3,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Transaksi",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: addProductController.productsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No products found"));
                }

                var products = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    var productData = product.data() as Map<String, dynamic>;
                    return ListTile(
                      onTap: () => Get.toNamed(
                        "/edit_data_produk",
                        arguments: product.id,
                      ),
                      title: Text("Nama : ${productData["name"] ?? "No Name"}"),
                      subtitle:
                          Text("Harga : ${productData["price"] ?? "No Price"}"),
                      trailing: IconButton(
                        onPressed: () {
                          controller.deleteProduct(product.id);
                        },
                        icon: Icon(
                          BootstrapIcons.trash,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/tambah_data_produk");
        },
        child: Icon(
          BootstrapIcons.plus_lg,
          size: 30,
        ),
      ),
    );
  }
}
