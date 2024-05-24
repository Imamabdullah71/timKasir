import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 2.0,
      width: 250.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 30),
            alignment: Alignment.center,
            height: 120,
            width: double.infinity,
            // color: Colors.amber,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person),
              ),
              title: Text('Profile'),
            ),
          ),
          Divider(
            thickness: 3,
          ),
          ListTile(
            leading: Icon(BootstrapIcons.database),
            title: Text('Manajemen'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Home
              Get.toNamed('/manajemen');
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.cart3),
            title: Text('Transaksi Penjualan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Profile
              Get.toNamed('/transaksi');
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.cash_stack),
            title: Text('Keuangan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.file_earmark),
            title: Text('Laporan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/halaman_laporan');
            },
          ),
          ListTile(
            leading: Icon(BootstrapIcons.gear),
            title: Text('Pengaturan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/halaman_pengaturan');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Get.offAllNamed("/halaman_intro");
            },
          ),
        ],
      ),
    );
  }
}
