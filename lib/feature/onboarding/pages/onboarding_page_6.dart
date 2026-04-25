import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:flutter/material.dart';

class OnboardingPage6 extends StatelessWidget {
  const OnboardingPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.035),
              Image.asset(AppImages.logo, scale: 4),

              Sh(h: 0.2),
              Row(
                mainAxisAlignment: .center,
                children: [
                  CustomText(
                    text: 'COURSE BUILDING',
                    color: AppColors.muslimGreen,
                    fontSize: 28,
                    fontWeight: .w400,
                    isKoulen: true,
                    lineHeight: 1,
                  ),
                  Sw(w: 0.01),
                  Image.asset(AppIcons.onboardingPage5, scale: 3.4),
                ],
              ),
              Sh(h: 0.02),
              Image.asset(AppImages.onboardingPage5, scale: 4),
              Sh(h: 0.02),
              CustomText(
                text:
                    'Get ready to start this exciting journey of \nlearning Chechen with over thousand students',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.2),
              PrimaryButton(title: 'Continue'),
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
        ),
      ),
    );
  }
}
