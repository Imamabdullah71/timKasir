import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/widgets/widget_drawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class ManageBarang extends StatelessWidget {
  const ManageBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manajemen".toUpperCase(),
          style: const TextStyle(
            color: Color.fromARGB(255, 114, 94, 225),
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
            leading: const Icon(BootstrapIcons.box_seam),
            title: const Text("Barang"),
            onTap: () {
              Get.toNamed("/halaman_barang");
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.grid),
            title: const Text("Kategori barang"),
            onTap: () {
              Get.toNamed("/kategori_page");
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.boxes),
            title: const Text("Manajemen stok"),
            onTap: () => Get.toNamed("/stok_barang_page"),
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.cart4),
            title: const Text("Pembelian barang"),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.person_vcard),
            title: const Text("Pelanggan dan Supplier"),
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/infaq_page");
        },
        child: const Icon(BootstrapIcons.plus_lg),
      ),
    );
  }
}
