import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgePage extends StatelessWidget {
  const AgePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
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
                msg: "How old are you buddy?",
                messageMaxWidth: 0.5,
              ),
              Sh(h: 0.05),
              CustomFormField(hintText: 'Enter your age'),

              Sh(h: isKeyboardOpen ? 0.1 : 0.45),
              PrimaryButton(
                onTap: () => Get.toNamed(AppRoutes.namePage),
                title: 'NEXT',
              ),
              Sh(h: 0.01),
              PrimaryButton(
                onTap: () => Get.toNamed(AppRoutes.namePage),
                title: 'Skip',
                fontColor: AppColors.blackout,
                backgroundColor: AppColors.transparent,
                borderColor: AppColors.transparent,
                shadowColor: AppColors.transparent,
                isManjari: true,
              ),
              // Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
