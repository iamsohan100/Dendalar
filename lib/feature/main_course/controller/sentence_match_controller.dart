import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum MatchResult { none, correct, wrong }

class SentenceMatchController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;
  final wordList = ['Хlара', 'сан', 'нана', 'йу'].obs;
  final selectedWordList = <int>[].obs; // Stores indices of selected words
  final Rx<MatchResult> result = MatchResult.none.obs;
  final String correctSentence = "Хlара сан нана йу";
  final correctWordList = ['Хlара', 'сан', 'нана', 'йу'].obs;


  @override
  void onInit() {
    super.onInit();
    // Reset result whenever selection changes
    ever(selectedWordList, (_) {
      result.value = MatchResult.none;
    });
  }

  final RxBool hasAttempted = false.obs;

  void checkAnswer() {
    if (selectedWordList.isEmpty) return;
    String currentSentence = selectedWordList
        .map((index) => wordList[index])
        .join(' ');
    if (currentSentence == correctSentence) {
      result.value = MatchResult.correct;
      hasAttempted.value = false;
    } else {
      result.value = MatchResult.wrong;
      hasAttempted.value = true;
      // Wait for 2 seconds and then reset to none
      Future.delayed(const Duration(seconds: 2), () {
        if (result.value == MatchResult.wrong) {
          result.value = MatchResult.none;
        }
      });
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
}
