import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MatchProgressMessage extends StatelessWidget {
  const MatchProgressMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: .topLeft,
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Container(
            clipBehavior: .antiAlias,
            width: scaleFactor * 46,
            height: scaleFactor * 46,
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
          Expanded(
            child: LinearProgressIndicator(
              value: 0.2,
              minHeight: scaleFactor * 10,
              backgroundColor: AppColors.sportyWhite,
              color: AppColors.primaryColor,
              borderRadius: .circular(scaleFactor * 16),
            ),
          ),
          Sw(w: 0.035),

          CustomText(
            text: '20%',
            color: AppColors.muslimGreen,
            fontSize: 20,
            fontWeight: .w400,
            isKoulen: true,
          ),
        ],
      ),
    );
  }
}
