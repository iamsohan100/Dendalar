// ignore_for_file: use_build_context_synchronously

import 'package:dendalar/feature/main_course/controller/active_level_controller.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:dendalar/feature/main_course/model/lesson_model.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _SummaryStep { sentence, dialog }

class SummaryLessonController extends GetxController {
  LessonModel? _sentenceLesson;
  LessonModel? _dialogLesson;

  bool _sentenceDone = false;
  bool _dialogDone = false;

  _SummaryStep? _currentStep;

  /// Summary image-এ tap করলে এখান থেকে শুরু হবে
  Future<void> startSummaryFlow({
    required BuildContext context,
    required List<LessonModel> lessonList,
  }) async {
    _sentenceLesson = lessonList.firstWhereOrNull(
      (l) => l.lessonType == 'SENTENCE',
    );
    _dialogLesson = lessonList.firstWhereOrNull(
      (l) => l.lessonType == 'DIALOGUE',
    );

    _sentenceDone =
        _sentenceLesson == null || _sentenceLesson?.isCompleted == true;
    _dialogDone = _dialogLesson == null || _dialogLesson?.isCompleted == true;

    if (!_sentenceDone) {
      await _startSentence(context);
    } else if (!_dialogDone) {
      await _startDialog(context);
    }
  }

  Future<void> _startSentence(BuildContext context) async {
    _currentStep = _SummaryStep.sentence;
    final sentenceController = Get.find<SentenceQuestionController>();
    sentenceController.onSummaryLessonComplete = () => _onTypeComplete(context);

    final ok = await sentenceController.getSentenceQuestion(
      context: context,
      lessonId: _sentenceLesson?.id ?? '',
    );

    if (ok) {
      Get.toNamed(AppRoutes.sentenceMatchPage);
    }
  }

  Future<void> _startDialog(BuildContext context) async {
    _currentStep = _SummaryStep.dialog;
    final dialogController = Get.find<DialogMatchController>();
    dialogController.onSummaryLessonComplete = () => _onTypeComplete(context);

    final ok = await dialogController.getDialogQuestion(
      context: context,
      lessonId: _dialogLesson?.id ?? '',
      page: 1,
    );

    if (ok) {
      Get.toNamed(AppRoutes.dialogMatchPage);
    }
  }

  Future<void> _onTypeComplete(BuildContext context) async {
    if (_currentStep == _SummaryStep.sentence) {
      _sentenceDone = true;

      if (_dialogLesson != null && !_dialogDone) {
        await _startDialog(context);
      } else {
        await Get.find<ActiveLevelController>().activeLevel(context: context);
        Get.offNamed(AppRoutes.levelCongratulationPage);
        _reset();
      }
    } else if (_currentStep == _SummaryStep.dialog) {
      _dialogDone = true;

      if (_sentenceLesson != null && !_sentenceDone) {
        await _startSentence(context);
      } else {
        await Get.find<ActiveLevelController>().activeLevel(context: context);
        Get.offNamed(AppRoutes.levelCongratulationPage);
        _reset();
      }
    }
  }

  void _reset() {
    _sentenceLesson = null;
    _dialogLesson = null;
    _sentenceDone = false;
    _dialogDone = false;
    _currentStep = null;
  }
}
