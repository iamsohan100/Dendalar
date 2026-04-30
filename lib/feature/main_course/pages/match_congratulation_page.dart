import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';

class MatchCongratulationPage extends StatelessWidget {
  const MatchCongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'START NEXT LEVEL',
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
              Sh(h: 0.03),
              Image.asset(AppImages.logo, scale: 4),

              Sh(h: 0.1),

              CustomText(
                text: 'CONGRATULATIONS',
                color: AppColors.primaryColor,
                fontSize: 33,
                fontWeight: .w400,
                isKoulen: true,
              ),
              Sh(h: 0.005),

              CustomText(
                text: 'You’ve Successfully completed the level',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.02),
              Image.asset(AppImages.matchCongratulation, scale: 4),

              Sh(h: 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
