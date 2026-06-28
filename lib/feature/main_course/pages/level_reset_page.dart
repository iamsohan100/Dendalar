import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/controller/reset_level_controller.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelResetPage extends StatelessWidget {
  const LevelResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final resetLevelController = Get.find<ResetLevelController>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () async {
              final response = await resetLevelController.resetLevel(
                context: context,
              );
              if (response) {
                Get.offAllNamed(AppRoutes.dashboardPage);
              }
            },
            title: 'Reset Level',
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
                text:
                    "You've successfully completed all levels! \nYou can now reset your progress and start again. ✅",
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
