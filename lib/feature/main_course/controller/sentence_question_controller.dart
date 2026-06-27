// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
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
  final currentQuestion = 1.obs; // 1-based, UI progress দেখানোর জন্য
  final currentIndex = 0.obs; // 0-based, list থেকে question বের করার জন্য

  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;

  final wordList = [].obs;
  final selectedWordList = <int>[].obs; // Stores indices of selected words
  final Rx<MatchResult> result = MatchResult.none.obs;
  final correctSentence = "".obs;
  final correctWordList = [].obs;
  final RxBool hasAttempted = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Reset result whenever selection changes
    ever(selectedWordList, (_) {
      result.value = MatchResult.none;
    });
  }

  /// নির্দিষ্ট index এর question লোড করে wordList/correctSentence সেট করে
  void loadQuestion(int index) {
    if (quesitonList == null || quesitonList!.isEmpty) return;
    if (index < 0 || index >= quesitonList!.length) return;

    final question = quesitonList![index];
    final words = (question.sentenceInLearningLanguage ?? '').split(" ");

    correctSentence.value = question.sentenceInLearningLanguage ?? '';
    correctWordList.value = words;

    // user কে দেখানোর জন্য shuffle করা word list
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

      // সঠিক উত্তর দেখানোর জন্য ১ সেকেন্ড অপেক্ষা
      await Future.delayed(const Duration(seconds: 1));

      final isSuccess = await activeQuestion(
        context: context,
        questionId: currentQuestionId,
      );

      if (isSuccess) {
        goToNextQuestion();
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

  /// পরের question-এ যাওয়ার জন্য
  void goToNextQuestion() {
    if (quesitonList == null || quesitonList!.isEmpty) return;

    if (currentIndex.value < quesitonList!.length - 1) {
      currentIndex.value++;
      currentQuestion.value = currentIndex.value + 1;
      loadQuestion(currentIndex.value);
    } else {
      Get.offNamed(AppRoutes.lessonCongratulationPage);
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

    // For iOS to play through speaker
    await flutterTts.setSharedInstance(true);
    await flutterTts
        .setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
        ], IosTextToSpeechAudioMode.defaultMode);

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

        // প্রথম question লোড করে ফেলি এখানেই
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

  Future<bool> activeQuestion({
    required BuildContext context,
    required String questionId,
  }) async {
    log("questionId:$questionId");
    bool isSuccess = true;
    try {
      mainLoading(context);

      final response = await ApiCaller.patchRequest(
        url: ApiUrls.activeQuestion,
        body: {"questionId": questionId},
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
