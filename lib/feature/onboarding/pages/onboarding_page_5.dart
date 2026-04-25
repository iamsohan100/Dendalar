import 'dart:async';

import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage5 extends StatefulWidget {
  const OnboardingPage5({super.key});

  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _routeNextPage();
    });
  }

  void _routeNextPage() {
    Timer(Duration(seconds: 1), () {
      Get.offNamed(AppRoutes.onboardingPage6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.035),
              Image.asset(AppImages.logo, scale: 4),

              Sh(h: 0.2),
              Row(
                mainAxisAlignment: .center,
                children: [
                  CustomText(
                    text: 'COURSE BUILDING',
                    color: AppColors.muslimGreen,
                    fontSize: 28,
                    fontWeight: .w400,
                    isKoulen: true,
                    lineHeight: 1,
                  ),
                  Sw(w: 0.01),
                  Image.asset(AppIcons.onboardingPage5, scale: 3.4),
                ],
              ),
              Sh(h: 0.02),
              Image.asset(AppImages.onboardingPage5, scale: 4),
              Sh(h: 0.02),
              CustomText(
                text:
                    'Get ready to start this exciting journey of \nlearning Chechen with over thousand students',
                color: AppColors.darkGreyishBrown,
                fontSize: 16,
                fontWeight: .w400,
                isManrope: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
