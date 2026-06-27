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
  // API response model
  Rx<DialogQuestionModel> dialogQuestionModel = DialogQuestionModel().obs;

  // current dialog-এর ৪টি question list
  final RxList<QuestionModel> currentDialogQuestions = <QuestionModel>[].obs;

  // pagination state
  final currentPage = 1.obs;
  final totalQuestions = 0.obs; // API-এর meta.total
  final int limit = 4;

  // dialog progress: কতটা dialog শেষ হয়েছে (progress bar এর জন্য)
  final completedDialogs = 0.obs;
  final totalDialogs = 0.obs; // ceil(total / limit)

  // current dialog-এর ভেতরে কোন question-এ আছি (0-based)
  final currentQuestionIndex = 0.obs;

  // current question-এর word options (missingWord split করে)
  final wordList = <String>[].obs;

  // ইউজার যে indices select করেছে (প্রতিটি blank-এর জন্য)
  final selectedIndices = <int>[].obs;

  // correct answers (current dialog-এর সব question-এর missingWord, ক্রমে)
  final correctAnswers = <String>[].obs;

  String? _lessonId;



  // ─────────────────────────────────────────────
  // API: dialog question লোড করা (page দিয়ে)
  // ─────────────────────────────────────────────
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
      // প্রথম page-এর জন্যই loading দেখাবো, পরের page গুলো (auto skip)
      // user-কে বুঝতে দেওয়ার দরকার নেই, তাই page অনুযায়ী loading skip করা যেতে পারে।
      // চাইলে এটা শুধু page == 1 এর জন্যও দেখাতে পারো, নিচে সবসময় দেখাচ্ছি simplicity এর জন্য।
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

        // incomplete questions only
        final incompleteQuestions =
            questions.where((q) => q.isCompleted == false).toList();

        if (meta != null) {
          totalQuestions.value = meta.total ?? 0;
          totalDialogs.value = ((meta.total ?? 0) / limit).ceil();
        }

        if (incompleteQuestions.isEmpty) {
          // ✅ এই page-এর সব question already completed।
          // পরের page আছে কিনা চেক করে দেখো — থাকলে সেই page-এর জন্য
          // আবার call করো (recursive), data পাওয়া পর্যন্ত এটা চলবে।
          final hasNextPage = (page * limit) < totalQuestions.value;

          if (hasNextPage) {
            return await getDialogQuestion(
              context: context,
              lessonId: lessonId,
              page: page + 1,
            );
          } else {
            // আর কোনো page নেই → পুরো lesson complete
            await _handleLessonCompletion(context);
            return isSuccess;
          }
        }

        currentDialogQuestions.addAll(incompleteQuestions);
        currentPage.value = page;

        // ✅ completedDialogs আগের completed page গুলোর সংখ্যা অনুযায়ী set করা
        // (যেমন page 1, 2 আগে থেকেই complete, এখন page 3-এ আছি →
        // completedDialogs = 2 হওয়া উচিত, যাতে progress bar ঠিক দেখায়)
        completedDialogs.value = page - 1;

        // প্রথম question লোড
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
  // ─────────────────────────────────────────────
  // current question থেকে wordList ও correctAnswers সেট করা
  // ─────────────────────────────────────────────
  void _loadCurrentQuestion() {
    wordList.clear();
    selectedIndices.clear();
    correctAnswers.clear();

    // current dialog-এর সব question-এর missingWord একটা list-এ রাখি
    // এবং word options তৈরি করি (প্রতিটি missingWord একটি option)
    final List<String> allMissingWords = currentDialogQuestions
        .map((q) => q.missingWord ?? '')
        .where((w) => w.isNotEmpty)
        .toList();

    correctAnswers.assignAll(allMissingWords);

    // wordList = সব missing words shuffle করা (options হিসেবে দেখাবো)
    final shuffled = List<String>.from(allMissingWords)..shuffle();
    wordList.assignAll(shuffled);
  }

  // ─────────────────────────────────────────────
  // Word toggle (select/deselect)
  // ─────────────────────────────────────────────
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

  // ─────────────────────────────────────────────
  // পুরো dialog শেষ হয়েছে কি না চেক করা
  // ─────────────────────────────────────────────
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

  // ─────────────────────────────────────────────
  // dialog complete হলে সব question active করে পরের dialog-এ যাওয়া
  // ─────────────────────────────────────────────
  Future<void> _onDialogCompleted() async {
    final context = Get.context;
    if (context == null) return;

    // current dialog-এর সব question active করা
    for (final question in currentDialogQuestions) {
      final questionId = question.id;
      if (questionId == null) continue;

      final isSuccess = await Get.find<ActiveQuestionController>().activeQuestion(
        context: context,
        questionId: questionId,
      );

      if (!isSuccess) return;
    }

    completedDialogs.value++;

    // পরের page আছে কিনা চেক করা
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

  // ─────────────────────────────────────────────
  // Lesson শেষ করা
  // ─────────────────────────────────────────────
  Future<void> _handleLessonCompletion(BuildContext context) async {
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

  // ─────────────────────────────────────────────
  // Correctness check helpers
  // ─────────────────────────────────────────────

  /// blank index-এর selection সঠিক কি না
  bool isSelectionCorrect(int blankIndex) {
    if (blankIndex >= selectedIndices.length) return true; // এখনো fill হয়নি

    final wordIndex = selectedIndices[blankIndex];
    final selectedWord = wordList[wordIndex];

    if (blankIndex < correctAnswers.length) {
      return selectedWord == correctAnswers[blankIndex];
    }
    return true;
  }

  /// নির্দিষ্ট wordList index-এর word ভুলভাবে select হয়েছে কি না
  bool isWordWrong(int wordListIndex) {
    final pos = selectedIndices.indexOf(wordListIndex);
    if (pos != -1) {
      return !isSelectionCorrect(pos);
    }
    return false;
  }

  // ─────────────────────────────────────────────
  // Progress bar এর জন্য
  // ─────────────────────────────────────────────
  double get progress {
    if (totalDialogs.value == 0) return 0;
    return completedDialogs.value / totalDialogs.value;
  }

  // ─────────────────────────────────────────────
  // fullSentence থেকে missingWord বাদ দিয়ে blank তৈরি করা
  // ─────────────────────────────────────────────

  /// fullSentence-এর মধ্যে missingWord খুঁজে সেটাকে _____ দিয়ে replace করে।
  /// যেমন: "Iуьйре дика хуьлда!" + missingWord="хуьлда!" → "Iуьйре дика _____"
  String getSentenceWithBlank(QuestionModel question) {
    final sentence = question.fullSentence ?? '';
    final missing = question.missingWord ?? '';

    if (missing.isEmpty || sentence.isEmpty) return sentence;

    // missingWord টা sentence-এ আছে কিনা চেক করে replace করো
    if (sentence.contains(missing)) {
      return sentence.replaceFirst(missing, '______');
    }

    // যদি exact match না হয়, sentence শেষে blank যোগ করো
    return '$sentence ______';
  }
}

