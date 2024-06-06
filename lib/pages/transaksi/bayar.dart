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
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("Foto Barang"),
                      ),
                      title: Text("Nama Barang"),
                      subtitle: Text('Harga: harga_jual barang'),
                      onTap: () {
                        print("Jumlah barang++");
                      },
                      trailing: Container(
                        child: Text(
                          "x1",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              minimumSize: Size(
                double.infinity, // Lebar
                48, // Tinggi
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {},
            child: Text(
              "Bayar (disini isi value jumlah yang harus dibayar)",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
