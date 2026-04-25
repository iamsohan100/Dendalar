import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});
  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleFactor * 16,
        vertical: scaleFactor * 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleFactor * 10),

        border: Border.all(color: AppColors.chalice, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.chalice,
            offset: Offset(2, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(AppIcons.triangle, scale: 4),
          Sw(w: 0.03),
          Expanded(
            child: CustomText(
              text: 'Boost my Career',
              color: AppColors.blackout,
              fontSize: 20,
              fontWeight: .w400,
              isKoulen: true,
            ),
          ),
          Icon(
            Icons.check_circle,
            color: AppColors.muslimGreen,
            size: scaleFactor * 24,
          ),
        ],
      ),
    );
  }
}
