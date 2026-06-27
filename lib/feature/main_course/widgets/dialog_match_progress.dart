import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Dialog match page-এর জন্য progress widget
class DialogMatchProgress extends StatelessWidget {
  const DialogMatchProgress({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    final controller = Get.find<DialogMatchController>();

    return Align(
      alignment: Alignment.topLeft,
      child: Obx(() {
        // ✅ Rx variables সরাসরি read করা → Obx reactive থাকবে
        final completed = controller.completedDialogs.value;
        final total = controller.totalDialogs.value;
        final progress = total == 0 ? 0.0 : completed / total;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: scaleFactor * 46,
              height: scaleFactor * 46,
              decoration: BoxDecoration(
                color: AppColors.grayHint,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppImages.onboardingPage4,
                scale: 4.5,
                fit: BoxFit.contain,
              ),
            ),
            Sw(w: 0.035),
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                minHeight: scaleFactor * 10,
                backgroundColor: AppColors.sportyWhite,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(scaleFactor * 16),
              ),
            ),
            Sw(w: 0.035),
            CustomText(
              text: '${(progress * 100).toStringAsFixed(0)}%',
              color: AppColors.muslimGreen,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              isKoulen: true,
            ),
          ],
        );
      }),
    );
  }
}
