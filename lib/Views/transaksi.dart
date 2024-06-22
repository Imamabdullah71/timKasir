import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/widgets/widget_drawer.dart';
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
            color: Color.fromARGB(255, 114, 94, 225),
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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            leading: const Icon(BootstrapIcons.cart3),
            title: const Text("Transaksi"),
            onTap: () {
              Get.toNamed("/transaksi_page");
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.clock_history),
            title: const Text("History Transaction"),
            onTap: () {
              Get.toNamed("/history_page_transaction");
            },
          ),
        ],
      ),
    );
  }
}
