// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dendalar/feature/main_course/controller/active_lesson_controller.dart';
import 'package:dendalar/feature/main_course/controller/active_question_controller.dart';
import 'package:dendalar/feature/main_course/model/question_model.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:dendalar/core/network/api_caller.dart';
import 'package:dendalar/core/network/api_urls.dart';
import 'package:dendalar/core/utils/loading/main_loading.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/feature/main_course/model/sentence_question_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MatchResult { none, correct, wrong }

class SentenceQuestionController extends GetxController {
  Rx<SentenceQuestionModel> sentenceQuestionModel = SentenceQuestionModel().obs;
  RxList<QuestionModel>? quesitonList = <QuestionModel>[].obs;

  final totalQuestions = 0.obs;
  final currentQuestion = 1.obs;
  final currentIndex = 0.obs;

  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;

  final wordList = [].obs;
  final selectedWordList = <int>[].obs;
  final Rx<MatchResult> result = MatchResult.none.obs;
  final correctSentence = "".obs;
  final correctWordList = [].obs;
  final RxBool hasAttempted = false.obs;

  Future<void> Function()? onSummaryLessonComplete;

  @override
  void onInit() {
    super.onInit();
    ever(selectedWordList, (_) {
      result.value = MatchResult.none;
    });
  }

  void loadQuestion(int index) {
    if (quesitonList == null || quesitonList!.isEmpty) return;
    if (index < 0 || index >= quesitonList!.length) return;

    final question = quesitonList![index];
    final words = (question.sentenceInLearningLanguage ?? '').split(" ");

    correctSentence.value = question.sentenceInLearningLanguage ?? '';
    correctWordList.value = words;

    wordList.value = List.from(words)..shuffle();

    selectedWordList.clear();
    result.value = MatchResult.none;
  }

  Future<void> checkAnswer({required BuildContext context}) async {
    if (selectedWordList.isEmpty) {
      bottomMessage(msg: "Please select words to form the sentence");
      return;
    }

    String currentSentence = selectedWordList
        .map((index) => wordList[index])
        .join(' ');

    if (currentSentence == correctSentence.value) {
      result.value = MatchResult.correct;
      hasAttempted.value = false;

      final currentQuestionId = quesitonList?[currentIndex.value].id;
      if (currentQuestionId == null) return;

      await Future.delayed(const Duration(seconds: 1));

      final activeQuestionController = Get.find<ActiveQuestionController>();
      final isSuccess = await activeQuestionController.activeQuestion(
        context: context,
        questionId: currentQuestionId,
      );

      if (!isSuccess) {
        if (activeQuestionController.lastMessage == "Next question not found!") {
          Get.offNamed(AppRoutes.levelResetPage);
        }
        return;
      }

      if (isSuccess) {
        await goToNextQuestion(context: context);
      }
    } else {
      result.value = MatchResult.wrong;
      hasAttempted.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        selectedWordList.clear();
        if (result.value == MatchResult.wrong) {
          result.value = MatchResult.none;
        }
      });
    }
  }

  Future<void> goToNextQuestion({required BuildContext context}) async {
    if (quesitonList == null || quesitonList!.isEmpty) return;

    if (currentIndex.value < quesitonList!.length - 1) {
      currentIndex.value++;
      currentQuestion.value = currentIndex.value + 1;
      loadQuestion(currentIndex.value);
    } else {
      if (onSummaryLessonComplete != null) {
        final callback = onSummaryLessonComplete;
        onSummaryLessonComplete = null;
        await callback?.call();
        return;
      }

      final lessonId = quesitonList?[currentIndex.value].lessonId;

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
  }

  void initTts() {
    flutterTts.setStartHandler(() {
      isPlaying.value = true;
    });

    flutterTts.setCompletionHandler(() {
      isPlaying.value = false;
    });

    flutterTts.setCancelHandler(() {
      isPlaying.value = false;
    });

    flutterTts.setErrorHandler((msg) {
      isPlaying.value = false;
    });
  }

  Future<void> speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setSharedInstance(true);
    await flutterTts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.playback,
      [
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
        IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
      ],
      IosTextToSpeechAudioMode.defaultMode,
    );

    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isPlaying.value = false;
  }

  Future<bool> getSentenceQuestion({
    required BuildContext context,
    required String lessonId,
  }) async {
    bool isSuccess = true;
    quesitonList?.clear();
    wordList.clear();
    selectedWordList.clear();
    correctWordList.clear();
    currentIndex.value = 0;
    currentQuestion.value = 1;

    try {
      mainLoading(context);
      final response = await ApiCaller.getRequest(
        url: ApiUrls.getSentenceQuestion(lessonId),
      );

      Navigator.pop(context);
      log("${response?.responseData.toString()}");
      if (response?.statusCode == 200 && response?.isSuccess == true) {
        sentenceQuestionModel.value = SentenceQuestionModel.fromJson(
          response?.responseData,
        );
        final incompleteQuestions =
            (sentenceQuestionModel.value.questionList ?? [])
                .where((q) => q.isCompleted == false)
                .toList();

        quesitonList?.addAll(incompleteQuestions);
        totalQuestions.value = quesitonList?.length ?? 1;

        loadQuestion(0);
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