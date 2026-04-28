import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sh(h: 0.03),
        CustomFormField(
          initialValue: 'iamsohan100',
          title: 'Username',
          hintText: 'Enter username',
          prefixIcon: Image.asset(
            AppIcons.username,
            scale: 3,
          ),
          suffixIcon: Image.asset(AppIcons.edit, scale: 3),
        ),
        Sh(h: 0.02),
        CustomFormField(
          initialValue: 'iamsohan11@gmail.com',
          title: 'Email',
          hintText: 'Enter email address',
          prefixIcon: Image.asset(AppIcons.email, scale: 3),
          suffixIcon: Image.asset(AppIcons.edit, scale: 3),
        ),
        Sh(h: 0.04),
        PrimaryButton(title: 'SAVE CHANGES'),
      ],
    );
  }
}
