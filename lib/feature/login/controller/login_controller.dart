// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/share_preference/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login(BuildContext context) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.login,
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
          "isMobileApp": true,
        },
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        await AuthPreference().saveLoginToken(
          token: response?.responseData['data']['accessToken'],
        );
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
