// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/text/custom_rich_text.dart';
import 'package:dendalar/feature/forget/controller/forget_controller.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key, this.isAccountVerify});
  final bool? isAccountVerify;

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  final registrationController = Get.find<RegistrationController>();
  final forgetController = Get.find<ForgetController>();
  RxInt timeInSecond = 60.obs;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeInSecond.value > 0) {
        timeInSecond.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        final minutes = (timeInSecond.value ~/ 60).toString().padLeft(2, '0');
        final seconds = (timeInSecond.value % 60).toString().padLeft(2, '0');

        return GestureDetector(
          onTap: timeInSecond.value == 0
              ? () async {
                  await _resendOtp();
                }
              : null,
          child: CustomRichText(
            text1: "Don’t Have OTP? ",

            fontSize1: 14,
            color1: AppColors.darkGreyishBrown,
            fontWeight: FontWeight.w500,
            fontWeight2: FontWeight.w600,

            text2: timeInSecond.value == 0 ? "Resend" : "$minutes:$seconds",
            color2: AppColors.primaryColor,
            fontSize2: 14,
          ),
        );
      }),
    );
  }

  Future<void> _resendOtp() async {
    final response = widget.isAccountVerify == true
        ? await registrationController.resendAccountVerifyOtp(context)
        : await forgetController.resendVerifyEmailAddress(context);

    if (response == true) {
      bottomMessage(msg: 'OTP sent successfully ✅');
      timeInSecond.value = 60;
      _startTimer();
    }
  }
}
