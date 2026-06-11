// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otp = ''.obs;
  final signUpToken = ''.obs;
  Future<bool> signUP(BuildContext context) async {


    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.postRequest(
        url: ApiUrls.registration,
        body: {},
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        signUpToken.value = response?.responseData['data']['signupPageToken'];
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

  // Future<bool> verifySignUpOtp(BuildContext context) async {
  //   bool isSuccess = true;

  //   try {
  //     mainLoading(context);

  //     final response = await ApiCaller.postRequest(
  //       token: signUpToken.value,
  //       url: ApiUrls.verifySignUpOtp,
  //       body: {"otp": otp.value},
  //     );

  //     Navigator.pop(context);

  //     log("${response?.responseData.toString()}");
  //     if (response?.statusCode == 200 && response?.isSuccess == true) {
  //       await AuthPreference().saveLoginToken(
  //         token: response?.responseData['data']['accessToken'],
  //       );
  //     } else {
  //       bottomMessage(msg: response?.message);
  //       isSuccess = false;
  //     }
  //   } catch (e) {
  //     bottomMessage(msg: e.toString());
  //     isSuccess = false;
  //   }

  //   return isSuccess;
  // }

}