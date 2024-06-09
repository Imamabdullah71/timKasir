import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:timkasirapp/Controllers/bottomBar_controller.dart';
import 'package:timkasirapp/main_home_page.dart';
import 'package:timkasirapp/Pages/laporan.dart';
import 'package:timkasirapp/Pages/management_barang/main_menu_barang.dart';
import 'package:timkasirapp/Pages/profile.dart';
import 'package:timkasirapp/Pages/transaksi.dart';
import 'widgets/widget_drawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';


// ignore: use_key_in_widget_constructors
class BottomBar extends StatelessWidget {
  final BottomBarController controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          const Transaksi(),
          const ManageBarang(),
          MainHomePage(),
          const Laporan(),
          const Pengaturan(),
        ],
      ),
      bottomNavigationBar: Obx(() => SalomonBottomBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onTabTapped,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(BootstrapIcons.cart2),
            title: const Text("Transaksi"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(BootstrapIcons.database),
            title: const Text("Barang"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(BootstrapIcons.file_earmark),
            title: const Text("Laporan"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.people),
            title: const Text("Profile"),
            selectedColor: Colors.purple,
          ),
        ],
      )),
    );
  }
}
