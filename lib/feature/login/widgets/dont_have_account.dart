import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/text/custom_rich_text.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: .center,
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(AppRoutes.onboardingPage1);
        },
        child: CustomRichText(
          text1: 'Don’t Have Account? ',
          text2: ' Register Now',
          color1: AppColors.blackout,
          color2: AppColors.primaryColor,
          fontSize1: 14,
          fontSize2: 15,
          fontWeight: FontWeight.w400,
          fontWeight2: FontWeight.w500,
        ),
      ),
    );
  }
}
