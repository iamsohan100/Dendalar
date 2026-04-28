import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/login/widgets/dont_have_account.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.01),
              Image.asset(AppImages.logo, scale: 4),
              Sh(h: 0.04),
              Image.asset(AppImages.login, scale: 4),
              Sh(h: 0.02),
              CustomText(
                text: 'Login to your Account',
                color: AppColors.blackout,
                fontSize: 30,
                fontWeight: .w400,
                isKoulen: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.027),
              CustomFormField(
                hintText: 'Enter email address',
                prefixIcon: Image.asset(AppIcons.email, scale: 3),
              ),
              Sh(h: 0.02),
              CustomFormField(
                hintText: 'Enter password',
                prefixIcon: Image.asset(AppIcons.pass, scale: 3),
              ),
              Sh(h: 0.015),
              Align(
                alignment: .topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.forgetPasswordPage);
                  },
                  child: CustomText(
                    text: 'Forgot Password',
                    fontSize: 14,
                    color: AppColors.blazeRed,
                    fontWeight: .w600,
                    isManjari: true,
                  ),
                ),
              ),
              Sh(h: 0.025),
              PrimaryButton(
                onTap: () {
                  Get.toNamed(AppRoutes.dashboardPage);
                },
                title: 'LOGIN',
              ),
              Sh(h: 0.035),
              DontHaveAccount(),
              Sh(h: 0.035),
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
              Sh(h: 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
