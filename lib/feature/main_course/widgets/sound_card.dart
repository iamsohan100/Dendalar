import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class SoundCard extends StatelessWidget {
  const SoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return Container(
      padding: .symmetric(
        vertical: scaleFactor * 10,
        horizontal: scaleFactor * 14,
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
      child: Image.asset(AppIcons.sound, scale: 4),
    );
  }
}
