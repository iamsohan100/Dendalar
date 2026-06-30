import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/forget/controller/forget_controller.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final forgetController = Get.find<ForgetController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Sh(h: 0.01),
                Image.asset(AppImages.logo, scale: 4),
                Sh(h: 0.03),
                Image.asset(AppImages.forget, scale: 4),
                Sh(h: 0.023),
                CustomText(
                  text: 'Forget Password',
                  color: AppColors.blackout,
                  fontSize: 30,
                  fontWeight: .w400,
                  isKoulen: true,
                  textAlign: TextAlign.center,
                ),
                Sh(h: 0.02),
                CustomText(
                  text:
                      'Let’s create your profile with personal details for \na more customized experience',
                  color: AppColors.darkGreyishBrown,
                  fontSize: 14,
                  fontWeight: .w400,
                  isManrope: true,
                  textAlign: TextAlign.center,
                ),
                Sh(h: 0.027),
                CustomFormField(
                  controller: forgetController.emailController,
                  hintText: 'Enter email address',
                  prefixIcon: Image.asset(AppIcons.email, scale: 3),
                  isMail: true,
                ),
                Sh(h: 0.07),
                PrimaryButton(
                  onTap: verifyEmailAddress,
                  title: 'Verify Email Address',
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
                Sh(h: 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyEmailAddress() async {
    if (_formKey.currentState!.validate()) {
      final response = await forgetController.verifyEmailAddress(context);
      if (response) {
        Get.toNamed(AppRoutes.verifyEmailPage);
      }
    }
  }
}
