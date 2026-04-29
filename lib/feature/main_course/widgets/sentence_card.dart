import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/message_container_2.dart';
import 'package:dendalar/feature/main_course/widgets/sound_card.dart';
import 'package:flutter/material.dart';

class SentenceCard extends StatelessWidget {
  const SentenceCard({super.key, required this.msg, this.alignment});
  final String msg;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: .topLeft,
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .start,
        children: [
          Image.asset(
            AppImages.onboardingPage1,
            width: scaleFactor * 60,
            fit: .contain,
          ),

          Sw(w: 0.035),
          MessageContainer2(msg: msg, maxWidth: 0.57, alignment: alignment),
          Sw(w: 0.035),
          SoundCard(),
        ],
      ),
    );
  }
}
