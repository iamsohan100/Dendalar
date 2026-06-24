// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/main_course/model/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterAndLessonController extends GetxController {
  Rx<ChapterModel> chapterModel = ChapterModel().obs;

  Future<bool> getChapter({
    required BuildContext context,
    required String id,
  }) async {
    bool isSuccess = true;
    try {
      mainLoading(context);
      final response = await ApiCaller.getRequest(url: ApiUrls.getChapter(id));

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        chapterModel.value = ChapterModel.fromJson(response?.responseData);
        
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

  // Future<bool> getLesson() async {
  //   bool isSuccess = true;
  //   try {
  //     final response = await ApiCaller.getRequest(url: ApiUrls.lesson);

  //     log("${response?.responseData.toString()}");
  //     if (response?.statusCode == 200 && response?.isSuccess == true) {
  //       lessonModel.value = LessonModel.fromJson(response?.responseData);
  //     } else {
  //       bottomMessage(msg: response?.message);
  //       isSuccess = false;
  //     }
  //   } catch (e) {
  //     bottomMessage(msg: e.toString());
  //     log(e.toString());
  //     isSuccess = false;
  //   }

  //   return isSuccess;
  // }
}
