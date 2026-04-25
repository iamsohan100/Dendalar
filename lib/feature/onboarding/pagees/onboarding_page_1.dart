import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/message_container.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

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
              Sh(h: 0.15),
              MessageContainer(msg: "Marsha doghiyla 👋"),
              Sh(h: 0.01),
              Image.asset(AppImages.onboardingPage1, scale: 4),
              Sh(h: 0.02),
              CustomText(
                text:
                    'Master the Chechen language through culture, \nhistory, and daily conversation',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.2),
              PrimaryButton(title: 'Get Started'),
              Sh(h: 0.02),
              PrimaryButton(
                title: 'I already have an account',
                fontColor: AppColors.blackout,
                backgroundColor: AppColors.white,
                borderColor: AppColors.chalice,
                shadowColor: AppColors.chalice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
