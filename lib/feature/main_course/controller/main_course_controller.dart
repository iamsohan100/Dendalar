import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCourseController extends GetxController {
  final currentLevel = 0.obs;
  final maxLevel = 3;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentLevel.value);
  }

  void nextLevel() {
    if (currentLevel.value < maxLevel) {
      currentLevel.value++;
      pageController.animateToPage(
        currentLevel.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousLevel() {
    if (currentLevel.value > 0) {
      currentLevel.value--;
      pageController.animateToPage(
        currentLevel.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    currentLevel.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
