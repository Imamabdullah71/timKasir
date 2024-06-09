import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';
import 'package:timkasirapp/widgets/widget_drawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

// ignore: use_key_in_widget_constructors
class MainHomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Utama".toUpperCase(),
          style: const TextStyle(
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
                icon: const Icon(BootstrapIcons.house),
                color: Colors.white,
                onPressed: () {
                  Get.offAllNamed("/halaman_utama");
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const WidgetDrawer(),
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
                          icon: const Icon(
                            BootstrapIcons.upc_scan,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
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
                          icon: const Icon(
                            BootstrapIcons.cart3,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
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
        ],
      ),
    );
  }
}
