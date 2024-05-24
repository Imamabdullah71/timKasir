import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var selectedIndex = 2.obs;
  final PageController pageController = PageController(initialPage: 2);

  void onTabTapped(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  void resetToHome() {
    selectedIndex.value = 2;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(2);
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
