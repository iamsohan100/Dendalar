import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sh(h: 0.03),
        CustomFormField(
          hintText: 'Enter previous password',
          prefixIcon: Image.asset(AppIcons.pass, scale: 3),
        ),
        Sh(h: 0.02),
        CustomFormField(
          hintText: 'Enter new password',
          prefixIcon: Image.asset(AppIcons.pass, scale: 3),
        ),
        Sh(h: 0.02),
        CustomFormField(
          hintText: 'Confirm new password',
          prefixIcon: Image.asset(AppIcons.pass, scale: 3),
        ),

        Sh(h: 0.04),
        PrimaryButton(title: 'SAVE CHANGES'),
      ],
    );
  }
}
