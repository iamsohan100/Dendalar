import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class SentenceMatchController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;



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
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
        ],
        IosTextToSpeechAudioMode.defaultMode
    );

    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isPlaying.value = false;
  }
}
