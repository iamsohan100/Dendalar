import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(title: 'NEXT'),
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
              Sh(h: 0.045),
              Board4Message(
                msg: "What’s your email address?",
                messageMaxWidth: 0.55,
              ),
              Sh(h: 0.05),
              CustomFormField(
                hintText: 'Enter email address',
                prefixIcon: Image.asset(AppIcons.email, scale: 3),
              ),

              Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
