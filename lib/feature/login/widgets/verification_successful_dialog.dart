import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic verificationSuccessfulDialog(BuildContext context) {
  double width = Screen.screenWidth(context);
  double scaleFactor = width / Screen.designWidth;

  Future.delayed(const Duration(seconds: 1), () {
    Get.offNamed(AppRoutes.loginPage);
  });

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: Center(
          child: Container(
            height: scaleFactor * 217,
            width: scaleFactor * 244,
            padding: EdgeInsets.all(scaleFactor * 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(scaleFactor * 19),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.verify, width: scaleFactor * 125),
                Sh(h: 0.008),
                CustomText(
                  text: 'Verification Successful',
                  color: AppColors.blackout,
                  fontSize: 14,
                  fontWeight: .w700,
                  isManrope: true,
                  textDecorationColor: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
