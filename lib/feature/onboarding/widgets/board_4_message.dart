import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/message_container_2.dart';
import 'package:flutter/material.dart';

class Board4Message extends StatelessWidget {
  const Board4Message({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: .topLeft,
      child: Row(
        children: [
          Container(
            clipBehavior: .antiAlias,
            width: scaleFactor * 80,
            height: scaleFactor * 80,
            decoration: BoxDecoration(
              color: AppColors.grayHint,
              shape: .circle,
            ),
            child: Image.asset(
              AppImages.onboardingPage4,
              scale: 4.5,
              fit: .contain,
            ),
          ),
          Sw(w: 0.035),
          MessageContainer2(
            msg: "Why do you want to learn Chechen language?",
            maxWidth: 0.65,
          ),
        ],
      ),
    );
  }
}
