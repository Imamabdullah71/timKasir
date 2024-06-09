import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widget_drawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class Laporan extends StatelessWidget {
  const Laporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan".toUpperCase(),
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.house),
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
            leading: const Icon(BootstrapIcons.archive),
            title: const Text("Laporan Infaq"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.graph_up),
            title: const Text("Laporan Laba Rugi"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.file_earmark_bar_graph),
            title: const Text("Laporan Penjualan"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.boxes),
            title: const Text("Laporan Persediaan"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
