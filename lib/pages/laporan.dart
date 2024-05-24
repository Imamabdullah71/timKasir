import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class Laporan extends StatelessWidget {
  const Laporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan".toUpperCase(),
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
            leading: Icon(BootstrapIcons.archive),
            title: Text("Laporan Infaq"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.graph_up),
            title: Text("Laporan Laba Rugi"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.file_earmark_bar_graph),
            title: Text("Laporan Penjualan"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(BootstrapIcons.boxes),
            title: Text("Laporan Persediaan"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
