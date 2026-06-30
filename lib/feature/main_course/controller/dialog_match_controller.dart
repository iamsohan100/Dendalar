// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/main_course/controller/active_lesson_controller.dart';
import 'package:dendalar/feature/main_course/controller/active_question_controller.dart';
import 'package:dendalar/feature/main_course/model/dialog_question_model.dart';
import 'package:dendalar/feature/main_course/model/question_model.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogMatchController extends GetxController {
  Rx<DialogQuestionModel> dialogQuestionModel = DialogQuestionModel().obs;

  final RxList<QuestionModel> currentDialogQuestions = <QuestionModel>[].obs;

  final currentPage = 1.obs;
  final totalQuestions = 0.obs;
  final int limit = 4;

  final completedDialogs = 0.obs;
  final totalDialogs = 0.obs;

  final currentQuestionIndex = 0.obs;

  final wordList = <String>[].obs;
  final selectedIndices = <int>[].obs;
  final correctAnswers = <String>[].obs;

  String? _lessonId;

  Future<void> Function()? onSummaryLessonComplete;

  Future<bool> getDialogQuestion({
    required BuildContext context,
    required String lessonId,
    int page = 1,
  }) async {
    _lessonId = lessonId;
    bool isSuccess = true;
    currentDialogQuestions.clear();
    wordList.clear();
    selectedIndices.clear();
    correctAnswers.clear();
    currentQuestionIndex.value = 0;

    try {
      mainLoading(context);
      final response = await ApiCaller.getRequest(
        url: ApiUrls.getDialogQuestion(lessonId, page),
      );

      Navigator.pop(context);
      log("DialogQuestion response: ${response?.responseData.toString()}");

      if (response?.statusCode == 200 && response?.isSuccess == true) {
        dialogQuestionModel.value = DialogQuestionModel.fromJson(
          response?.responseData,
        );

        final meta = dialogQuestionModel.value.questionData?.meta;
        final questions =
            dialogQuestionModel.value.questionData?.questionList ?? [];

        final incompleteQuestions =
            questions.where((q) => q.isCompleted == false).toList();

        if (meta != null) {
          totalQuestions.value = meta.total ?? 0;
          totalDialogs.value = ((meta.total ?? 0) / limit).ceil();
        }

        if (incompleteQuestions.isEmpty) {
          final hasNextPage = (page * limit) < totalQuestions.value;

          if (hasNextPage) {
            return await getDialogQuestion(
              context: context,
              lessonId: lessonId,
              page: page + 1,
            );
          } else {
            await _handleLessonCompletion(context);
            return isSuccess;
          }
        }

        currentDialogQuestions.addAll(incompleteQuestions);
        currentPage.value = page;
        completedDialogs.value = page - 1;

        _loadCurrentQuestion();
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

  void _loadCurrentQuestion() {
    wordList.clear();
    selectedIndices.clear();
    correctAnswers.clear();

    final List<String> allMissingWords = currentDialogQuestions
        .map((q) => q.missingWord ?? '')
        .where((w) => w.isNotEmpty)
        .toList();

    correctAnswers.assignAll(allMissingWords);

    final shuffled = List<String>.from(allMissingWords)..shuffle();
    wordList.assignAll(shuffled);
  }

  void toggleWord(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      if (selectedIndices.length < correctAnswers.length) {
        selectedIndices.add(index);
      }
    }

    _checkDialogCompletion();
  }

  void _checkDialogCompletion() {
    if (selectedIndices.length != correctAnswers.length) return;

    bool allCorrect = true;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (!isSelectionCorrect(i)) {
        allCorrect = false;
        break;
      }
    }

    if (allCorrect) {
      Future.delayed(const Duration(milliseconds: 600), () {
        _onDialogCompleted();
      });
    }
  }

  Future<void> _onDialogCompleted() async {
    final context = Get.context;
    if (context == null) return;

    final activeQuestionController = Get.find<ActiveQuestionController>();

    for (final question in currentDialogQuestions) {
      final questionId = question.id;
      if (questionId == null) continue;

      final isSuccess = await activeQuestionController.activeQuestion(
        context: context,
        questionId: questionId,
      );

      if (!isSuccess) {
        if (activeQuestionController.lastMessage == "Next question not found!") {
          Get.offNamed(AppRoutes.levelResetPage);
        }
        return;
      }
    }

    completedDialogs.value++;

    final nextPage = currentPage.value + 1;
    final hasNextPage = (currentPage.value * limit) < totalQuestions.value;

    if (hasNextPage) {
      await getDialogQuestion(
        context: context,
        lessonId: _lessonId!,
        page: nextPage,
      );
    } else {
      await _handleLessonCompletion(context);
    }
  }

  Future<void> _handleLessonCompletion(BuildContext context) async {
    if (onSummaryLessonComplete != null) {
      final callback = onSummaryLessonComplete;
      onSummaryLessonComplete = null;
      await callback?.call();
      return;
    }

    final lessonId = currentDialogQuestions.isNotEmpty
        ? currentDialogQuestions.last.lessonId
        : null;

    if (lessonId == null) {
      Get.offNamed(AppRoutes.lessonCongratulationPage);
      return;
    }

    final isLessonSuccess = await Get.find<ActiveLessonController>()
        .activeLesson(context: context, lessonId: lessonId);

    if (isLessonSuccess) {
      Get.offNamed(AppRoutes.lessonCongratulationPage);
    }
  }

  bool isSelectionCorrect(int blankIndex) {
    if (blankIndex >= selectedIndices.length) return true;

    final wordIndex = selectedIndices[blankIndex];
    final selectedWord = wordList[wordIndex];

    if (blankIndex < correctAnswers.length) {
      return selectedWord == correctAnswers[blankIndex];
    }
    return true;
  }

  bool isWordWrong(int wordListIndex) {
    final pos = selectedIndices.indexOf(wordListIndex);
    if (pos != -1) {
      return !isSelectionCorrect(pos);
    }
    return false;
  }

  double get progress {
    if (totalDialogs.value == 0) return 0;
    return completedDialogs.value / totalDialogs.value;
  }

  String getSentenceWithBlank(QuestionModel question) {
    final sentence = question.fullSentence ?? '';
    final missing = question.missingWord ?? '';

    if (missing.isEmpty || sentence.isEmpty) return sentence;

    if (sentence.contains(missing)) {
      return sentence.replaceFirst(missing, '______');
    }

    return '$sentence ______';
  }
}