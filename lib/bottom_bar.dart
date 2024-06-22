import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tim_kasir/Controllers/bottom_bar_controller.dart';
import 'package:tim_kasir/main_home_page.dart';
import 'package:tim_kasir/Views/laporan.dart';
import 'package:tim_kasir/Views/management_barang/main_menu_barang.dart';
import 'package:tim_kasir/Views/profile.dart';
import 'package:tim_kasir/Views/transaksi.dart';
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
      bottomNavigationBar: Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SalomonBottomBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onTabTapped,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(BootstrapIcons.cart2),
                  title: const Text("Transaksi"),
                  selectedColor: const Color.fromARGB(255, 114, 94, 225),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(BootstrapIcons.database),
                  title: const Text("Barang"),
                  selectedColor: const Color.fromARGB(255, 114, 94, 225),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: const Color.fromARGB(255, 114, 94, 225),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(BootstrapIcons.file_earmark),
                  title: const Text("Laporan"),
                  selectedColor: const Color.fromARGB(255, 114, 94, 225),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.people),
                  title: const Text("Profile"),
                  selectedColor: const Color.fromARGB(255, 114, 94, 225),
                ),
              ],
            ),
          )),
    );
  }
}
