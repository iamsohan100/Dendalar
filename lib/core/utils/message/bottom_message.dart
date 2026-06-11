import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bottomMessage({required String? msg, bool error = false}) {
  // আগের নোটিফিকেশন থাকলে তা সরিয়ে ফেলি
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }

  Get.rawSnackbar(
    messageText: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CustomText(
            text: msg ?? 'Something went wrong',
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => Get.closeCurrentSnackbar(),
          child: const Icon(Icons.close, color: AppColors.white, size: 18),
        ),
      ],
    ),
    backgroundColor: AppColors.blackout.withValues(alpha: 0.7),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: 12,
    duration: const Duration(seconds: 6),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
