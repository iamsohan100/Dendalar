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

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () => Get.offAllNamed(AppRoutes.loginPage),
            title: 'Continue',
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
              Sh(h: 0.035),
              Image.asset(AppImages.logo, scale: 4),

              Sh(h: 0.1),

              MessageContainer(
                msg: "Marsha doghiyla 👋",
                rightMargin: 0.1,
                triangleRightPadding: 0.35,
              ),
              Sh(h: 0.01),
              Image.asset(AppImages.congratulation, scale: 4),
              Sh(h: 0.013),
              CustomText(
                text: 'You’re all set to go buddy',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
