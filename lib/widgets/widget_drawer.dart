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
            padding: const EdgeInsets.only(left: 10, top: 30),
            alignment: Alignment.center,
            height: 120,
            width: double.infinity,
            // color: Colors.amber,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person),
              ),
              title: const Text('Profile'),
            ),
          ),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.database),
            title: const Text('Manajemen'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Home
              Get.toNamed('/manajemen');
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.cart3),
            title: const Text('Transaksi Penjualan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Profile
              Get.toNamed('/transaksi');
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.cash_stack),
            title: const Text('Keuangan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.file_earmark),
            title: const Text('Laporan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/halaman_laporan');
            },
          ),
          ListTile(
            leading: const Icon(BootstrapIcons.gear),
            title: const Text('Pengaturan'),
            onTap: () {
              // Fungsi saat ditekan
              // Misalnya, navigasi ke halaman Settings
              Get.toNamed('/halaman_pengaturan');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Get.offAllNamed("/halaman_intro");
            },
          ),
        ],
      ),
    );
  }
}
