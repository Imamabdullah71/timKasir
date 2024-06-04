import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:timkasirapp/Controllers/bottomBar_controller.dart';
import 'package:timkasirapp/mainHomePage.dart';
import 'package:timkasirapp/Pages/laporan.dart';
import 'package:timkasirapp/Pages/management_barang/manage_barang.dart';
import 'package:timkasirapp/Pages/profile.dart';
import 'package:timkasirapp/Pages/transaksi.dart';
import './widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';


class BottomBar extends StatelessWidget {
  final BottomBarController controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          Transaksi(),
          ManageBarang(),
          MainHomePage(),
          Laporan(),
          Pengaturan(),
        ],
      ),
      bottomNavigationBar: Obx(() => SalomonBottomBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onTabTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(BootstrapIcons.cart2),
            title: Text("Transaksi"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(BootstrapIcons.database),
            title: Text("Barang"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(BootstrapIcons.file_earmark),
            title: Text("Laporan"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.people),
            title: Text("Profile"),
            selectedColor: Colors.purple,
          ),
        ],
      )),
    );
  }
}
