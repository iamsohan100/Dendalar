// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final otp = ''.obs;
  final signUpToken = ''.obs;
  final purpose = ''.obs;
  final referralSource = ''.obs;
  final ageController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<bool> registration(BuildContext context) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.registration,
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "name": nameController.text.trim(),
          "role": "USER",
          "purpose": purpose.value,
          "referralSource": referralSource.value,
          "age": int.tryParse(ageController.text.trim()) ?? 2,
        },
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 201 && response?.isSuccess == true) {
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
          "purpose": "VERIFY_ACCOUNT",
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

  Future<bool> resendAccountVerifyOtp(BuildContext context) async {
    bool isSuccess = true;

    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.resendAccountVerifyOtp,
        body: {
          "email": emailController.text.trim(),
          "purpose": "VERIFY_ACCOUNT",
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
