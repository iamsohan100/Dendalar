import 'dart:async';

import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/text/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({
    super.key,
    this.email,
    this.phone,
    this.isMail = false,
    this.isUpdatePhone,
    this.isForgotPassword,
    this.isSignUp,
  });
  final String? email;
  final String? phone;
  final bool isMail;
  final bool? isUpdatePhone;
  final bool? isForgotPassword;
  final bool? isSignUp;
  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  RxInt timeInSecond = 60.obs;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeInSecond.value > 0) {
        timeInSecond.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Obx(() {
          final minutes = (timeInSecond.value ~/ 60).toString().padLeft(2, '0');
          final seconds = (timeInSecond.value % 60).toString().padLeft(2, '0');

          return CustomRichText(
            text1: "Don’t Have OTP? ",

            fontSize1: 14,
            color1: AppColors.darkGreyishBrown,
            fontWeight: FontWeight.w500,
            fontWeight2: FontWeight.w600,

            text2: timeInSecond.value == 0 ? "Resend" : "$minutes:$seconds",
            color2: AppColors.primaryColor,
            fontSize2: 14,
          );
        }),
      ),
    );
  }
}
