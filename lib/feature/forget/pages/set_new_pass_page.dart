import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/password_required_helper.dart';
import 'package:dendalar/feature/forget/controller/forget_controller.dart';
import 'package:dendalar/feature/login/widgets/pass_saved_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetNewPassPage extends StatefulWidget {
  const SetNewPassPage({super.key});

  @override
  State<SetNewPassPage> createState() => _SetNewPassPageState();
}

class _SetNewPassPageState extends State<SetNewPassPage> {
  final forgetController = Get.find<ForgetController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    forgetController.passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    forgetController.passwordController.removeListener(_onPasswordChanged);
    super.dispose();
  }

  void _onPasswordChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final password = forgetController.passwordController.text;

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
                  controller: forgetController.passwordController,
                  hintText: 'Enter new password',
                  prefixIcon: Image.asset(AppIcons.pass, scale: 3),
                  isPassword: true,
                  isPasswordValidation: true,
                ),
                Sh(h: 0.02),
                PasswordRequiredHelper(password: password),
                Sh(h: 0.02),
                CustomFormField(
                  controller: forgetController.confirmPasswordController,
                  hintText: 'Confirm New password',
                  prefixIcon: Image.asset(AppIcons.pass, scale: 3),
                  isPassword: true,
                  isPasswordValidation: true,
                ),
                Sh(h: 0.07),
                PrimaryButton(onTap: saveChanges, title: 'SAVE CHANGES'),
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

  void saveChanges() async {
    if (_formKey.currentState!.validate()) {
      if (forgetController.passwordController.text !=
          forgetController.confirmPasswordController.text) {
        bottomMessage(msg: "Passwords do not match ⛔");
        return;
      }
      final response = await forgetController.resetPassword(context);
      if (response && mounted) {
        passSavedDialog(context);
      }
    }
  }
}
