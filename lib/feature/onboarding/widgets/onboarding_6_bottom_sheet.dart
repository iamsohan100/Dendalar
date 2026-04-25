import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/onboarding/controllers/onboarding_6_controller.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void onboarding6BottomSheet(BuildContext context) {
  final height = Screen.screenHeight(context);
  final width = Screen.screenWidth(context);
  final scaleFactor = width / Screen.designWidth;
  final controller = Get.put(Onboarding6Controller());
  final cardsData = [
    {'title': 'Facebook', 'icon': AppIcons.facebook},
    {'title': 'Instagram', 'icon': AppIcons.instagram},
    {'title': 'TikTok', 'icon': AppIcons.tiktok},
    {'title': 'Other'},
  ];
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(scaleFactor * 32),
        topLeft: Radius.circular(scaleFactor * 32),
      ),
    ),

    builder: (context) {
      return PopScope(
        canPop: false,
        child: Container(
          constraints: BoxConstraints(maxHeight: height * 0.8),
          width: width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(scaleFactor * 32),
              topLeft: Radius.circular(scaleFactor * 32),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(scaleFactor * 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: 'Where did you hear \nfrom us?',
                    color: AppColors.blackout,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    isKoulen: true,
                    textAlign: TextAlign.center,
                    lineHeight: 1.2,
                  ),

                  Sh(h: 0.02),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cardsData.length,
                    itemBuilder: (context, index) {
                      final card = cardsData[index];
                      return Obx(() {
                        return OnboardingCard(
                          title: card['title']!,
                          icon: card['icon'], // Removed ! to allow null
                          onTap: () {
                            controller.isSelected.value = index;
                          },
                          isSelected: controller.isSelected.value == index,
                        );
                      });
                    },
                    separatorBuilder: (context, index) {
                      return Sh(h: 0.016);
                    },
                  ),
                  Sh(h: 0.03),

                  PrimaryButton(title: 'Continue'),
                  Sh(h: 0.01),
                  PrimaryButton(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    title: 'Back',
                    fontColor: AppColors.blackout,
                    backgroundColor: AppColors.transparent,
                    borderColor: AppColors.transparent,
                    shadowColor: AppColors.transparent,
                    isManjari: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
