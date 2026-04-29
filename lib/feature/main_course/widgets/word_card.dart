import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: scaleFactor * 16,
          vertical: scaleFactor * 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(scaleFactor * 9),
          border: Border.all(
            color: isSelected ? AppColors.zuccini : AppColors.chalice,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? AppColors.zuccini : AppColors.chalice,
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
          color: isSelected ? AppColors.white : AppColors.blackout,
          isManrope: true,
        ),
      ),
    );
  }
}


