import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/main_course/model/level_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCourseController extends GetxController {
  final currentLevel = 0.obs;
  final maxLevel = 3;
  late PageController pageController;

  final inProgress = false.obs;
  Rx<LevelModel> levelModel = LevelModel().obs;

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

  Future<bool> getLevel() async {
    bool isSuccess = true;
    try {
      inProgress.value = true;
      final response = await ApiCaller.getRequest(url: ApiUrls.levels);

      inProgress.value = false;
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        levelModel.value = LevelModel.fromJson(response?.responseData);
      } else {
        bottomMessage(msg: response?.message);
        isSuccess = false;
      }
    } catch (e) {
      bottomMessage(msg: e.toString());
      log(e.toString());
      isSuccess = false;
    }

    return isSuccess;
  }
}
