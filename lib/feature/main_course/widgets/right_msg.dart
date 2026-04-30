import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class RightMessage extends StatelessWidget {
  const RightMessage({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: .topRight,
      child: Row(
        mainAxisAlignment: .end,
        crossAxisAlignment: .center,
        children: [
          Align(
            alignment: Alignment.centerRight,

            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: .center,
              children: [
                Positioned(
                  right: -10,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      AppIcons.triangle2,
                      scale: 4,
                      color: AppColors.sweetGrey,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleFactor * 14,
                    vertical: scaleFactor * 14,
                  ),
                  constraints: BoxConstraints(
                    minWidth: width * 0.3,
                    maxWidth: width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grayHint),
                    borderRadius: BorderRadius.circular(scaleFactor * 12),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: msg,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Sw(w: 0.035),

          Transform.flip(
            flipX: true,
            child: Image.asset(
              AppImages.onboardingPage1,
              width: scaleFactor * 60,
              fit: .contain,
            ),
          ),
        ],
      ),
    );
  }
}
