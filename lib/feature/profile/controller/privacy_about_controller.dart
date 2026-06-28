// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/profile/model/privacy_about_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyAboutController extends GetxController {
  Rx<PrivacyAboutModel> privacyAboutModel = PrivacyAboutModel().obs;

  Future<bool> getPrivacyAbout(BuildContext context) async {
    bool isSuccess = true;

    try {
      mainLoading(context);

      final response = await ApiCaller.getRequest(url: ApiUrls.privacyAbout);

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        privacyAboutModel.value = PrivacyAboutModel.fromJson(
          response?.responseData,
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
