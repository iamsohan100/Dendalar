import 'package:dendalar/routes/app_routes.dart';
import 'package:get/get.dart';

class DialogMatchController extends GetxController {
  final wordList = [
    'Iуьйре дика',
    'Со дика',
    'хуьлда!',
    'буй',
    'Сан',
    'боккха',
    'хуьлда!',
  ].obs;

  // Store indices to handle duplicate words correctly
  final selectedIndices = <int>[].obs;

  // Correct words for each blank in order
  final correctAnswers = [
    'Iуьйре дика',
    'Со дика',
    'хуьлда!',
    'буй',
    'Сан',
    'боккха',
    'хуьлда!',
  ];

  void toggleWord(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      if (selectedIndices.length < correctAnswers.length) {
        selectedIndices.add(index);
      }
    }

    _checkCompletion();
  }

  void _checkCompletion() {
    if (selectedIndices.length == correctAnswers.length) {
      bool allCorrect = true;
      for (int i = 0; i < correctAnswers.length; i++) {
        if (!isSelectionCorrect(i)) {
          allCorrect = false;
          break;
        }
      }
      if (allCorrect) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offNamed(AppRoutes.matchCongratulationPage);
        });
      }
    }
  }

  // Check if the word at a specific blank index is correct
  bool isSelectionCorrect(int blankIndex) {
    if (blankIndex >= selectedIndices.length) return true; // Not filled yet

    int wordIndex = selectedIndices[blankIndex];
    String selectedWord = wordList[wordIndex];

    if (blankIndex < correctAnswers.length) {
      return selectedWord == correctAnswers[blankIndex];
    }
    return true;
  }

  // Check if a specific word index in wordList is currently a "wrong" selection
  bool isWordWrong(int wordListIndex) {
    int pos = selectedIndices.indexOf(wordListIndex);
    if (pos != -1) {
      return !isSelectionCorrect(pos);
    }
    return false;
  }
}
