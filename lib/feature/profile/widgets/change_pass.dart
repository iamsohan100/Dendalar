import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/password_required_helper.dart';
import 'package:dendalar/feature/profile/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final changePasswordController = Get.find<ChangePasswordController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    changePasswordController.passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    changePasswordController.passwordController.removeListener(
      _onPasswordChanged,
    );
    super.dispose();
  }

  void _onPasswordChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String password = changePasswordController.passwordController.text;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Sh(h: 0.03),
          CustomFormField(
            controller: changePasswordController.previousPassController,
            hintText: 'Enter previous password',
            prefixIcon: Image.asset(AppIcons.pass, scale: 3),
            isPassword: true,
          ),
          Sh(h: 0.02),
          CustomFormField(
            controller: changePasswordController.passwordController,
            hintText: 'Enter new password',
            prefixIcon: Image.asset(AppIcons.pass, scale: 3),
            isPassword: true,
            isPasswordValidation: true,
          ),
          Sh(h: 0.02),
          PasswordRequiredHelper(password: password),
          Sh(h: 0.02),

          CustomFormField(
            controller: changePasswordController.confirmPasswordController,
            hintText: 'Confirm new password',
            prefixIcon: Image.asset(AppIcons.pass, scale: 3),
            isPassword: true,
            isPasswordValidation: true,
          ),

          Sh(h: 0.04),
          PrimaryButton(onTap: saveChanges, title: 'SAVE CHANGES'),
        ],
      ),
    );
  }

  void saveChanges() async {
    if (_formKey.currentState!.validate()) {
      if (changePasswordController.passwordController.text !=
          changePasswordController.confirmPasswordController.text) {
        bottomMessage(msg: "Passwords do not match ⛔");
        return;
      }
      final response = await changePasswordController.changePassword(context);
      if (response) {
        bottomMessage(msg: 'Password changed successfully.');
      }
    }
  }
}
