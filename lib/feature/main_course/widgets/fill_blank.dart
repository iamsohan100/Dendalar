import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class FillBlank extends StatelessWidget {
  const FillBlank({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Container(
      width: width,
      alignment: .center,
      decoration: BoxDecoration(
        color: AppColors.muslimGreen.withValues(alpha: 0.04),
        borderRadius: .circular(scaleFactor * 8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleFactor * 12,
        vertical: scaleFactor * 10,
      ),
      child: CustomText(
        text:
            'Fill in the blanks within the dialogue boxes to cotinue the flow of conversation',
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: .w500,
        isManrope: true,
      ),
    );
  }
}
