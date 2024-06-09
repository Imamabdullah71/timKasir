import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widget_drawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaksi",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(
              BootstrapIcons
                  .star, // Ikon yang ingin ditampilkan di dalam CircleAvatar
              color: Colors.black, // Warna ikon
              size: 24.0, // Ukuran ikon
            ),
          ),
          IconButton(
            icon: const Icon(BootstrapIcons.three_dots_vertical),
            onPressed: () {
              Get.offAllNamed("/halaman_utama");
            },
          ),
        ],
      ),
      drawer: const WidgetDrawer(),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                BootstrapIcons.plus_lg,
                size: 30,
              ),
              // Icon(
              //   BootstrapIcons.back,
              //   size: 30,
              // ),
              Icon(
                BootstrapIcons.upc_scan,
                size: 30,
              ),
              Icon(
                Icons.percent_rounded,
                size: 30,
              ),
              Icon(
                BootstrapIcons.tags,
                size: 30,
              ),
              Icon(
                Icons.search,
                size: 30,
              ),
              // Icon(
              //   BootstrapIcons.alipay,
              //   size: 30,
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple, // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kategori 1",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple, // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kategori 2",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple, // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kategori 3",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple, // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kategori 4",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/barang/coklat.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text("Coklat"),
                  subtitle: const Text("Jumlah barang : 52"),
                ),
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      BootstrapIcons.plus_lg,
                      size: 40,
                    ),
                  ),
                  title: const Text("Tambah Barang"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
