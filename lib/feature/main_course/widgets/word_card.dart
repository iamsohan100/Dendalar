import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.title,
    this.onTap,
    this.isSelected = false,
    this.isWrong = false, // Added isWrong
  });
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isWrong; // Added isWrong

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    // Determine colors based on state
    Color backgroundColor = AppColors.white;
    Color borderColor = AppColors.chalice;
    Color textColor = AppColors.blackout;

    if (isSelected) {
      if (isWrong) {
        backgroundColor = AppColors.red; // Or a specific red color
        borderColor = AppColors.red;
        textColor = AppColors.white;
      } else {
        backgroundColor = AppColors.primaryColor;
        borderColor = AppColors.zuccini;
        textColor = AppColors.white;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: scaleFactor * 16,
          vertical: scaleFactor * 8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(scaleFactor * 9),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: borderColor,
              offset: Offset(2, 3),
              blurRadius: 0,
            ),
          ],
        ),
        child: CustomText(
          text: title,
          textAlign: TextAlign.center,
          textOverflow: TextOverflow.clip,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
          isManrope: true,
        ),
      ),
    );
  }
}
