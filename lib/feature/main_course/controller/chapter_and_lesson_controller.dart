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

  Rx<ChapterData?> summaryChapter = Rx<ChapterData?>(null);

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
        final model = ChapterModel.fromJson(response?.responseData);

        final fullList = model.chapterList ?? [];
        final summary = fullList.firstWhereOrNull(
          (c) => (c.name?.trim().toLowerCase() == 'summary'),
        );

        if (summary != null) {
          fullList.removeWhere((c) => c.id == summary.id);
        }

        summaryChapter.value = summary;
        chapterModel.value = model;
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