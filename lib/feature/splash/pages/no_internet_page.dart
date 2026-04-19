// lib/presentation/ui/screen/no_internet_screen.dart

import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/splash/controllers/connection_checker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final connection = Get.find<ConnectionCheckerController>();
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 90, color: AppColors.red),
            Sh(h: 0.02),
            CustomText(
              text: 'No Internet Connection',
              color: AppColors.black,
              fontSize: 22,
              fontWeight: .w700,
            ),

            Sh(h: 0.01),
            CustomText(
              text: 'Please check your connection and try again.',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: .w400,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => connection.checkInitialConnection(),
              icon: Icon(
                Icons.refresh,
                color: AppColors.white,
                size: scaleFactor * 25,
              ),
              label: CustomText(
                text: 'Retry',
                color: AppColors.white,
                fontSize: 16,
                fontWeight: .w500,
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: scaleFactor * 26,
                  vertical: scaleFactor * 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
