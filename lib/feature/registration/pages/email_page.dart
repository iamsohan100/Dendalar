import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final registrationController = Get.find<RegistrationController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
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
                  msg: "What’s your email address?",
                  messageMaxWidth: 0.55,
                ),
                Sh(h: 0.05),
                CustomFormField(
                  controller: registrationController.emailController,
                  hintText: 'Enter email address',
                  isMail: true,
                  prefixIcon: Image.asset(AppIcons.email, scale: 3),
                ),
                Sh(h: isKeyboardOpen ? 0.1 : 0.45),

                PrimaryButton(onTap: next, title: 'NEXT'),
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

  void next() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.completeProfilePage);
    }
  }
}
