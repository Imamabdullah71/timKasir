import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widget_drawer.dart';
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.cart4),
            title: const Text("Pembelian barang"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.person_vcard),
            title: const Text("Pelanggan dan Supplier"),
            onTap: () {},
          ),
          // ListTile(
          //   leading: const Icon(BootstrapIcons.journal_text),
          //   title: const Text("Barang Test"),
          //   onTap: () {
          //     Get.toNamed("/uplaod_page_barang");
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(BootstrapIcons.folder),
          //   title: const Text("Folder"),
          //   onTap: () {
          //     Get.toNamed("/uplaod_page");
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(BootstrapIcons.pen),
          //   title: const Text("Count Page"),
          //   onTap: () {
          //     Get.toNamed("/count_page");
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(BootstrapIcons.funnel),
          //   title: const Text("Image Picker Testing"),
          //   onTap: () {
          //     Get.toNamed("/mencoba_image_picker");
          //   },
          // ),
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
