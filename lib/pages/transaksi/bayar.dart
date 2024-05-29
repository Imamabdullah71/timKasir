import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:bootstrap_icons/bootstrap_icons.dart';


class Pembayaran extends StatelessWidget {
  final RxBool bukaTutupSearch = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran",
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Obx(
                () => bukaTutupSearch.value
                    ? Column(
                        children: [
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari Barang...',
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey.shade600,
                                      ),
                                      border: OutlineInputBorder(
                                        // borderSide: BorderSide(color: Colors.red),s
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                          color: Colors.purple,
                                        ), // Warna border saat fokus
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade500,
                                        ), // Change border color here
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    bukaTutupSearch.toggle();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20)
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  bukaTutupSearch.toggle();
                                },
                                icon: Icon(
                                  BootstrapIcons.search,
                                  size: 30,
                                  color: Colors.purple,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  BootstrapIcons.upc_scan,
                                  size: 30,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                // scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
