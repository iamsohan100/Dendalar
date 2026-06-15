  import 'package:dendalar/core/utils/helper/validation_helper.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';



class PasswordRequiredHelper extends StatelessWidget {
  const PasswordRequiredHelper({super.key, required this.password});

  final String password;

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.005,
      children: [
        buildRequirementRow(
          '8-20 characters',
          ValidationHelper.hasMinLength(password) &&
              ValidationHelper.hasMaxLength(password),
        ),
        buildRequirementRow(
          'At least one uppercase letter',
          ValidationHelper.hasUppercase(password),
        ),
        buildRequirementRow(
          'At least one lowercase letter',
          ValidationHelper.hasLowercase(password),
        ),
        buildRequirementRow(
          'At least one number',
          ValidationHelper.hasNumber(password),
        ),
        buildRequirementRow(
          'At least one special character (!\$@%)',
          ValidationHelper.hasSpecialChar(password),
        ),
      ],
    );
  }
}


Widget buildRequirementRow(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.cancel,
          color: isMet ? Colors.green : Colors.grey,
          size: 16,
        ),
        const SizedBox(width: 8),
        CustomText(
          text: text,
          color: isMet ? Colors.green : Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
