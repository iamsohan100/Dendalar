// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/main_course/controller/main_course_controller.dart';
import 'package:dendalar/feature/main_course/controller/reset_level_controller.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void resetLevelDialog({required BuildContext context}) {
  final height = Screen.screenHeight(context);
  final width = Screen.screenWidth(context);
  final scaleFactor = width / Screen.designWidth;
  final resetLevelController = Get.find<ResetLevelController>();
  showDialog(
    context: context,
    builder: (context) {
      return Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Color(
                0xFF171725,
              ).withValues(alpha: 0.24), // Slight dark overlay
            ),
          ),
          Dialog(
            backgroundColor: AppColors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: width * 0.06),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(scaleFactor * 20),
            ),
            child: Padding(
              padding: EdgeInsets.all(scaleFactor * 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height * 0.01),
                    Container(
                      width: scaleFactor * 76,
                      height: scaleFactor * 76,
                      decoration: BoxDecoration(
                        color: AppColors.blazeRed.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.blazeRed,
                        size: scaleFactor * 35,
                      ),
                    ),
                    Sh(h: 0.015),

                    CustomText(
                      text: 'Reset Level',
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    Sh(h: 0.01),

                    CustomText(
                      text:
                          'This action cannot be undone. All progress \nwill be permanently lost.',
                      color: AppColors.darkGreyishBrown,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    Sh(h: 0.025),

                    CustomFormField(
                      title: 'Confirm phrase',

                      controller: resetLevelController.resetLevelController,
                      hintText: 'Type "resetlevel" here...',
                      isRequired: true,
                    ),
                    Sh(h: 0.01),
                    Align(
                      alignment: .topStart,
                      child: CustomText(
                        text: 'Please type the phrase exactly to proceed.',
                        color: AppColors.darkGreyishBrown,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Sh(h: 0.035),
                    Row(
                      spacing: width * 0.04,
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            title: 'Cancel',

                            backgroundColor: AppColors.grayHint,
                            borderColor: AppColors.transparent,
                            fontColor: AppColors.black,
                            shadowColor: AppColors.transparent,
                            buttonHeight: 0.048,
                            radius: 8,
                            isManjari: false,
                            fontSize: 15,
                            fontWeight: .w700,
                          ),
                        ),
                        Expanded(
                          child: PrimaryButton(
                            onTap: () async {
                              if (resetLevelController.resetLevelController.text
                                      .trim() !=
                                  "resetlevel") {
                                return bottomMessage(
                                  msg: 'Please enter "resetlevel"',
                                );
                              }
                              final response = await resetLevelController
                                  .resetLevel(context: context);
                              if (response) {
                                Navigator.pop(context);
                                Get.find<ProfileController>().getProfile();
                                Get.find<MainCourseController>().getLevel();

                                bottomMessage(
                                  msg: "Level has been reset successfully ✅",
                                );
                              }
                            },
                            title: 'Confirm Reset',

                            backgroundColor: AppColors.blazeRed,
                            borderColor: AppColors.transparent,
                            fontColor: AppColors.white,
                            shadowColor: AppColors.transparent,
                            buttonHeight: 0.048,
                            radius: 8,
                            isManjari: false,
                            fontSize: 15,
                            fontWeight: .w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
