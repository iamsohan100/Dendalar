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
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final registrationController = Get.find<RegistrationController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                CustomFormField(
                  controller: registrationController.nameController,
                  hintText: 'Enter your user name',
                ),
                Sh(h: isKeyboardOpen ? 0.1 : 0.35),

                PrimaryButton(onTap: next, title: 'NEXT'),
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
                Sh(h: 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void next() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.emailPage);
    }
  }
}
