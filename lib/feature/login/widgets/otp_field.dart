import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    final scaleFactor = width / Screen.designWidth;
    // final height = Screen.screenHeight(context);
    return Form(
      key: _formKey,
      child: SizedBox(
        width: width,
        child: PinCodeTextField(
          controller: otpTEController,
          appContext: context,
          pastedTextStyle: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          textStyle: GoogleFonts.poppins(
            color: AppColors.muslimGreen,
            fontWeight: .w400,
            fontSize: scaleFactor * 14,
          ),
          animationType: AnimationType.fade,

          pinTheme: PinTheme(
            shape: PinCodeFieldShape.circle,
            // borderRadius: BorderRadius.circular(scaleFactor * 10),
            fieldHeight: scaleFactor * 55,
            fieldWidth: scaleFactor * 55,
            borderWidth: 0.8,
            selectedBorderWidth: 0.8,
            activeBorderWidth: 0.8,
            inactiveBorderWidth: 0.8,
            errorBorderWidth: 0.8,
            disabledBorderWidth: 0.8,
            activeFillColor: AppColors.transparent,
            activeColor: AppColors.muslimGreen,
            selectedFillColor: AppColors.transparent,
            inactiveFillColor: AppColors.transparent,
            inactiveColor: AppColors.muslimGreen,
            selectedColor: AppColors.muslimGreen,
          ),
          cursorColor: AppColors.blackout,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          onCompleted: (_) {},
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpTEController.dispose();
    super.dispose();
  }
}
