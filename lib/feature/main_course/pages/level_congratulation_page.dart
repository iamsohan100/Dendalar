import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelCongratulationPage extends StatelessWidget {
  const LevelCongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () => Get.offAllNamed(AppRoutes.dashboardPage),
            title: 'Start Next Level',
          ),
          Sh(h: 0.01),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.02),
              Image.asset(AppImages.logo, scale: 4),

              Sh(h: 0.08),

              CustomText(
                text: 'Congratulations',
                color: AppColors.primaryColor,
                fontSize: 29,
                fontWeight: .w400,
                isKoulen: true,
              ),
              Sh(h: 0.01),
              CustomText(
                text: "You’ve Successfully completed the level",
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.03),

              Image.asset(AppImages.levelComplete, scale: 4),

              Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
