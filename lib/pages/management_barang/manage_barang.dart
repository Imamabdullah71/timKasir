import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class ManageBarang extends StatelessWidget {
  const ManageBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manajemen".toUpperCase(),
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
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(
            leading: Icon(BootstrapIcons.box_seam),
            title: Text("Barang"),
            onTap: () {
              Get.toNamed("/halaman_barang");
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.grid),
            title: Text("Kategori barang"),
            onTap: () {
              Get.toNamed("/kategori_page");
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.boxes),
            title: Text("Manajemen stok"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.cart4),
            title: Text("Pembelian barang"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.person_vcard),
            title: Text("Pelanggan dan Supplier"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.journal_text),
            title: Text("Barang Test"),
            onTap: () {
              Get.toNamed("/uplaod_page_barang");
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.folder),
            title: Text("Folder"),
            onTap: () {
              Get.toNamed("/uplaod_page");
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.pen),
            title: Text("Count Page"),
            onTap: () {
              Get.toNamed("/count_page");
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.funnel),
            title: Text("Filter Page"),
            onTap: () {
              Get.toNamed("/filter_page");
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/infaq_page");
        },
        child: Icon(BootstrapIcons.plus_lg),
      ),
    );
  }
}








