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
  ];

  void toggleWord(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
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
