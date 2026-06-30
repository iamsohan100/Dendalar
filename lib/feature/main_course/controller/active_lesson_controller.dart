// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ActiveLessonController extends GetxController {
  Future<bool> activeLesson({
    required BuildContext context,
    required String lessonId,
  }) async {
    log("lessonId:$lessonId");
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.patchRequest(
        url: ApiUrls.activeLesson,
        body: {"lessonId": lessonId},
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


}