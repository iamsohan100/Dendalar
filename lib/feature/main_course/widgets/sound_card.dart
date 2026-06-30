import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoundCard extends StatefulWidget {
  const SoundCard({super.key, required this.msg});
  final String msg;

  @override
  State<SoundCard> createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard> {
  final sentenceQuestionController = Get.find<SentenceQuestionController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sentenceQuestionController.initTts();
    });
  }

  @override
  void dispose() {
    sentenceQuestionController.flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return GestureDetector(
      onTap: () {
        if (sentenceQuestionController.isPlaying.value) {
          sentenceQuestionController.stop();
        } else {
          sentenceQuestionController.speak(widget.msg);
        }
      },
      child: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical:
                scaleFactor *
                (sentenceQuestionController.isPlaying.value ? 7 : 10),
            horizontal:
                scaleFactor *
                (sentenceQuestionController.isPlaying.value ? 8 : 14),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(scaleFactor * 12),
            border: Border.all(color: AppColors.zuccini, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.zuccini,
                offset: Offset(2, 3),
                blurRadius: 0,
              ),
            ],
          ),
          child: sentenceQuestionController.isPlaying.value
              ? Icon(
                  Icons.stop_rounded,
                  color: Colors.white,
                  size: scaleFactor * 30,
                )
              : Image.asset(AppIcons.sound, scale: 4),
        );
      }),
    );
  }
}
