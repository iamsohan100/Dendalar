import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

void levelCompletedDialog({required BuildContext context}) {
  // final height = Screen.screenHeight(context);
  final width = Screen.screenWidth(context);
  final scaleFactor = width / Screen.designWidth;
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.white,
        insetPadding: .symmetric(horizontal: width * 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: .circular(scaleFactor * 20),
        ),
        child: Padding(
          padding: .all(scaleFactor * 16),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Sh(h: 0.01),
              CustomText(
                text: 'Level Completed',
                color: AppColors.blackout,
                fontSize: 20,
                fontWeight: .w400,
                isKoulen: true,
              ),
              Sh(h: 0.005),
              CustomText(
                text: 'Congratulations! You have already completed this level.',
                color: AppColors.darkGreyishBrown,
                fontSize: 13,
                fontWeight: .w400,
                isManrope: true,
              ),
              Sh(h: 0.015),
              Image.asset(AppImages.verify, scale: 4),
              Sh(h: 0.02),
              PrimaryButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'GOT IT',
              ),
              Sh(h: 0.01),
            ],
          ),
        ),
      );
    },
  );
}
