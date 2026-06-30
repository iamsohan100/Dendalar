// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResetLevelController extends GetxController {
  final resetLevelController = TextEditingController();
  Future<bool> resetLevel({required BuildContext context}) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.patchRequest(
        url: ApiUrls.resetLevel,
        body: {},
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
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

  @override
  void onClose() {
    super.onClose();
    resetLevelController.dispose();
  }
}
