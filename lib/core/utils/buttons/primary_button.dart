import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  final double? radius;
  final double? buttonHeight;
  final Color? fontColor;
  final bool? isShadow;
  const PrimaryButton({
    super.key,
    this.onTap,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.radius,
    this.buttonHeight,
    this.fontColor,
    this.isShadow,
  });

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * (buttonHeight ?? 0.061),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(scaleFactor * (radius ?? 14)),
          border: Border.all(
            color: borderColor ?? AppColors.transparent,
            width: 1,
          ),
        ),
        child: CustomText(
          text: title,
          textAlign: TextAlign.center,
          textOverflow: TextOverflow.clip,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: fontColor ?? AppColors.white,
        ),
      ),
    );
  }
}
