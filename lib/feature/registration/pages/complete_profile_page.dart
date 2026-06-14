import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final registrationController = Get.find<RegistrationController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(children: [
       
        ],
      ),
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
                  msg: "Let’s complete the final step. Set password",
                  messageMaxWidth: 0.6,
                ),
                Sh(h: 0.05),
                CustomFormField(
                  controller: registrationController.passwordController,
                  hintText: 'Enter new password',
                  prefixIcon: Image.asset(AppIcons.pass, scale: 3),
                  isPassword: true,
                ),
                Sh(h: 0.02),
                CustomFormField(
                  controller: registrationController.confirmPasswordController,
                  hintText: 'Confirm new password',
                  prefixIcon: Image.asset(AppIcons.pass, scale: 3),
                  isPassword: true,
                ),
                Sh(h: isKeyboardOpen ? 0.1 : 0.375),

                PrimaryButton(
                  onTap: completeProfile,
                  title: 'Complete Profile',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void completeProfile() async {
    if (_formKey.currentState!.validate()) {
      if (registrationController.passwordController.text !=
          registrationController.confirmPasswordController.text) {
        bottomMessage(msg: "Passwords do not match");
        return;
      }
      final response = await registrationController.registration(context);
      if (response) {
        Get.toNamed(AppRoutes.verifyAccountPage);
      }
    }
  }
}
