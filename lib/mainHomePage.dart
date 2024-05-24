import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

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
            IconButton(
              icon: Icon(BootstrapIcons.house),
              onPressed: () {
                Get.offAllNamed("/halaman_utama");
              },
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
                            onPressed: () {
                              Get.toNamed("/halaman_scan");
                            },
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
                              Get.toNamed("/halaman_bayar");
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
          ],
        ));
  }
}
