// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  final otp = ''.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final resetToken = ''.obs;

  Future<bool> verifyEmailAddress(BuildContext context) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.resendAccountVerifyOtp,
        body: {
          "email": emailController.text.trim(),
          "purpose": "RESET_PASSWORD",
        },
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

  Future<bool> verifyAccount(BuildContext context) async {
    bool isSuccess = true;

    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.verifyAccount,
        body: {
          "email": emailController.text.trim(),
          "otp": otp.value.trim(),
          "purpose": "RESET_PASSWORD",
        },
      );

      Navigator.pop(context);

      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        resetToken.value = response?.responseData['data']['resetToken'];
      } else {
        bottomMessage(msg: response?.message);
        isSuccess = false;
      }
    } catch (e) {
      bottomMessage(msg: e.toString());
      isSuccess = false;
    }

    return isSuccess;
  }

  Future<bool> resendVerifyEmailAddress(BuildContext context) async {
    bool isSuccess = true;

    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.resendAccountVerifyOtp,
        body: {
          "email": emailController.text.trim(),
          "purpose": "RESET_PASSWORD",
        },
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
      isSuccess = false;
    }

    return isSuccess;
  }

  Future<bool> resetPassword(BuildContext context) async {
    bool isSuccess = true;

    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.passReset,
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
          "resetToken": resetToken.value,
        },
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
      isSuccess = false;
    }

    return isSuccess;
  }
}
