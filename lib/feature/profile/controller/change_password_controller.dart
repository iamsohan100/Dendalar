// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final previousPassController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<bool> changePassword(BuildContext context) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.changePass,
        body: {
          "oldPassword": previousPassController.text,
          "newPassword": confirmPasswordController.text,
        },
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        previousPassController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
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
