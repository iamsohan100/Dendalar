import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/widgets/left_msg.dart';
import 'package:dendalar/feature/main_course/widgets/right_msg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlankMessage extends StatelessWidget {
  const BlankMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DialogMatchController>();

    return Obx(() {
      final questions = controller.currentDialogQuestions;
      if (questions.isEmpty) return const SizedBox.shrink();

      // ✅ Obx-এর ভেতরে directly read করা হচ্ছে → reactive subscription সক্রিয় থাকবে
      final selectedIndices = controller.selectedIndices.toList();
      final wordList = controller.wordList.toList();

      int wordsConsumed = 0;

      // নির্দিষ্ট blank-count অনুযায়ী selected word গুলো বের করা
      List<String> getWordsFor(String msg) {
        int blankCount = RegExp(r'_{2,}').allMatches(msg).length;
        return selectedIndices
            .skip(wordsConsumed)
            .take(blankCount)
            .map((index) => wordList[index])
            .toList();
      }

      // নির্দিষ্ট blank-count অনুযায়ী correctness list বের করা
      List<bool> getCorrectnessFor(String msg) {
        int blankCount = RegExp(r'_{2,}').allMatches(msg).length;
        List<bool> result = [];
        for (int i = 0; i < blankCount; i++) {
          result.add(controller.isSelectionCorrect(wordsConsumed + i));
        }
        wordsConsumed += blankCount;
        return result;
      }

      // সব widget inline build করা হচ্ছে (Builder widget নেই → Obx tracking নষ্ট হবে না)
      final List<Widget> children = [];

      for (int i = 0; i < questions.length; i++) {
        if (i > 0) children.add(Sh(h: 0.02));

        final msg = controller.getSentenceWithBlank(questions[i]);
        final filled = getWordsFor(msg);
        final correctness = getCorrectnessFor(msg);

        if (i.isEven) {
          children.add(
            LeftMessage(
              msg: msg,
              filledWords: filled,
              isCorrectList: correctness,
            ),
          );
        } else {
          children.add(
            RightMessage(
              msg: msg,
              filledWords: filled,
              isCorrectList: correctness,
            ),
          );
        }
      }

      return Column(children: children);
    });
  }
}
