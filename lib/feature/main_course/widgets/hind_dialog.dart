import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/main_course/controller/sentence_match_controller.dart';
import 'package:dendalar/feature/main_course/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void hindDialog({required BuildContext context}) {
  final height = Screen.screenHeight(context);
  final width = Screen.screenWidth(context);
  final scaleFactor = width / Screen.designWidth;
  final sentenceMatchController = Get.find<SentenceMatchController>();

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
              Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                spacing: width * 0.01,
                children: [
                  Image.asset(AppIcons.hind, scale: 6),
                  CustomText(
                    text: 'VIEW HINTS',
                    color: AppColors.blackout,
                    fontSize: 20,
                    fontWeight: .w400,
                    isKoulen: true,
                    lineHeight: 1,
                  ),
                  Image.asset(AppIcons.hind, scale: 6),
                ],
              ),
              Sh(h: 0.02),

              Wrap(
                spacing: width * 0.02,
                runSpacing: height * 0.02,
                children: [
                  for (
                    int i = 0;
                    i < sentenceMatchController.correctWordList.length;
                    i++
                  )
                    WordCard(
                      title: sentenceMatchController.correctWordList[i],
                      isSelected: true,
                    ),
                ],
              ),
              Sh(h: 0.02),
              Container(
                width: width,
                alignment: .center,
                decoration: BoxDecoration(
                  color: AppColors.muslimGreen.withValues(alpha: 0.04),
                  borderRadius: .circular(scaleFactor * 5),
                ),
                padding: .all(scaleFactor * 10),
                child: CustomText(
                  text: 'This is my mother',
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: .w500,
                ),
              ),
              Sh(h: 0.015),
              Image.asset(AppImages.setPass, scale: 6),
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
