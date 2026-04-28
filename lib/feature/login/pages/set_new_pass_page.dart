import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:flutter/material.dart';

class SetNewPassPage extends StatelessWidget {
  const SetNewPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.01),
              Image.asset(AppImages.logo, scale: 4),
              Sh(h: 0.03),
              Image.asset(AppImages.setPass, scale: 4),
              Sh(h: 0.023),
              CustomText(
                text: 'SET NEW PASSWORD',
                color: AppColors.blackout,
                fontSize: 30,
                fontWeight: .w400,
                isKoulen: true,
                textAlign: TextAlign.center,
              ),
              Sh(h: 0.027),
              CustomFormField(
                hintText: 'Enter new password',
                prefixIcon: Image.asset(AppIcons.pass, scale: 3),
              ),
              Sh(h: 0.02),
              CustomFormField(
                hintText: 'Confirm New password',
                prefixIcon: Image.asset(AppIcons.pass, scale: 3),
              ),
              Sh(h: 0.07),
              PrimaryButton(title: 'SAVE CHANGES'),
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
    );
  }
}
