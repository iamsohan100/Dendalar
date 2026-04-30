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
    final dialogMatchController = Get.find<DialogMatchController>();

    return Obx(() {
      int wordsConsumed = 0;

      // Helper to get words for a msg
      List<String> getWordsFor(String msg) {
        int blankCount = RegExp(r'_{2,}').allMatches(msg).length;
        var result = dialogMatchController.selectedIndices
            .skip(wordsConsumed)
            .take(blankCount)
            .map((index) => dialogMatchController.wordList[index])
            .toList();
        return result;
      }

      // Helper to get correctness for a msg
      List<bool> getCorrectnessFor(String msg) {
        int blankCount = RegExp(r'_{2,}').allMatches(msg).length;
        List<bool> result = [];
        for (int i = 0; i < blankCount; i++) {
          result.add(
            dialogMatchController.isSelectionCorrect(wordsConsumed + i),
          );
        }
        wordsConsumed += blankCount;
        return result;
      }

      String msg1 = "__________ йойла, Амина. Муха йу хьо?";
      String msg2 = "Дална везийла, Адам. ______  йу, хьо муха ву?";
      String msg3 = "Дела реза _______ Амина, хьан доьзал муха бу?";
      String msg4 = " Дална везийла, Адам. ______  йу, хьо муха ву?";
      String msg5 = "__________ йойла, Амина. Муха йу хьо?";
      String msg6 = "Дална везийла, Адам. ______  йу, хьо муха ву?";
      String msg7 = "Дела реза _______ Амина, хьан доьзал муха бу?";

      return Column(
        children: [
          LeftMessage(
            msg: msg1,
            filledWords: getWordsFor(msg1),
            isCorrectList: getCorrectnessFor(msg1),
          ),
          Sh(h: 0.02),
          RightMessage(
            msg: msg2,
            filledWords: getWordsFor(msg2),
            isCorrectList: getCorrectnessFor(msg2),
          ),
          Sh(h: 0.02),
          LeftMessage(
            msg: msg3,
            filledWords: getWordsFor(msg3),
            isCorrectList: getCorrectnessFor(msg3),
          ),
          Sh(h: 0.02),
          RightMessage(
            msg: msg4,
            filledWords: getWordsFor(msg4),
            isCorrectList: getCorrectnessFor(msg4),
          ),
          Sh(h: 0.02),
          LeftMessage(
            msg: msg5,
            filledWords: getWordsFor(msg5),
            isCorrectList: getCorrectnessFor(msg5),
          ),
          Sh(h: 0.02),
          RightMessage(
            msg: msg6,
            filledWords: getWordsFor(msg6),
            isCorrectList: getCorrectnessFor(msg6),
          ),
          Sh(h: 0.02),

          LeftMessage(
            msg: msg7,
            filledWords: getWordsFor(msg7),
            isCorrectList: getCorrectnessFor(msg7),
          ),
        ],
      );
    });
  }
}
