import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/login/widgets/otp_field.dart';
import 'package:dendalar/feature/login/widgets/resend_otp.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Sh(h: 0.03),

                    CustomText(
                      text: 'Confirm It’s Really You.',
                      color: AppColors.blackout,
                      fontSize: 30,
                      fontWeight: .w400,
                      isKoulen: true,
                    ),
                    Sh(h: 0.005),
                    CustomText(
                      text: 'Enter the 6-digit code from your email.',
                      color: AppColors.darkGreyishBrown,
                      fontSize: 14,
                      fontWeight: .w400,
                      isManrope: true,
                    ),
                    Sh(h: 0.027),
                    OtpField(),
                    Sh(h: 0.03),

                    ResendOtp(),
                    Sh(h: 0.04),

                    PrimaryButton(title: 'VERIFY'),

                    Sh(h: 0.1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
