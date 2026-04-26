import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/message_container.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () => Get.toNamed(AppRoutes.onboardingPage4),
            title: 'Continue',
          ),
          Sh(h: 0.01),
          PrimaryButton(
            onTap: () => Navigator.pop(context),
            title: 'Back',
            fontColor: AppColors.blackout,
            backgroundColor: AppColors.transparent,
            borderColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            isManjari: true,
          ),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.035),
              Image.asset(AppImages.logo, scale: 4),
              Sh(h: 0.1),
              MessageContainer(
                msg: "But I’ve some questions ⁉️",
                maxWidth: 0.5,
                rightMargin: 0.1,
              ),
              Sh(h: 0.01),
              Image.asset(AppImages.onboardingPage3, scale: 4),
              Sh(h: 0.02),
              CustomText(
                text:
                    'Before staring our journey let’s access \nyour proficiency is Chechen',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
