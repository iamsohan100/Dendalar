import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () => Get.toNamed(AppRoutes.emailPage),
            title: 'NEXT',
          ),
          Sh(h: 0.02),
          Row(
            spacing: width * 0.03,
            mainAxisAlignment: .center,
            children: [
              SizedBox(
                width: width * 0.15,
                child: Divider(color: AppColors.chalice),
              ),
              CustomText(
                text: 'or sign up with',
                color: AppColors.darkGreyishBrown,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),

              SizedBox(
                width: width * 0.15,
                child: Divider(color: AppColors.chalice),
              ),
            ],
          ),
          Sh(h: 0.02),

          PrimaryButton(
            title: 'Sign up using Google',
            icon: Image.asset(AppIcons.google, scale: 4),
            backgroundColor: AppColors.white,
            borderColor: AppColors.chalice,
            shadowColor: AppColors.chalice,
            fontColor: AppColors.blackGrape,
            isManjari: true,
            fontSize: 14,
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
              Sh(h: 0.045),
              Board4Message(
                msg: "What’s your name buddy?",
                messageMaxWidth: 0.525,
              ),
              Sh(h: 0.05),
              CustomFormField(hintText: 'Enter your user name'),

              Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
