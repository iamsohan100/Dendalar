// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final editProfile = true.obs;
  final changePass = false.obs;
  final setting = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  final inProgress = false.obs;

  Future<bool> getProfile() async {
    bool isSuccess = true;
    try {
      inProgress.value = true;
      final response = await ApiCaller.getRequest(url: ApiUrls.getProfile);

      inProgress.value = false;
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        profileModel.value = ProfileModel.fromJson(response?.responseData);
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

  Future<bool> updateProfile(BuildContext context) async {
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.patchRequest(
        url: ApiUrls.getProfile,
        body: {"name": nameController.text.trim()},
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        getProfile();
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
