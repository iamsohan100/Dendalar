import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String image;
  final double imageScale;
  final String title;

  const SettingButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.image,
    required this.title,
    required this.imageScale,
  });

  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return GestureDetector(
      behavior: .opaque,
      onTap: onTap,
      child: Container(
        width: width,
        padding: .symmetric(
          horizontal: scaleFactor * 20,
          vertical: scaleFactor * 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: .all(color: AppColors.grayHint),
          borderRadius: .circular(scaleFactor * 9),
        ),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Image.asset(image, scale: imageScale),
            Sw(w: 0.04),
            CustomText(
              text: title,
              color: AppColors.darkGreyishBrown,
              fontSize: 14,
              fontWeight: .w500,
              isManjari: true,
            ),
            Spacer(),
            Icon(icon, color: AppColors.black, size: scaleFactor * 18),
          ],
        ),
      ),
    );
  }
}
