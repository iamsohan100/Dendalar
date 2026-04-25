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
  final Color? shadowColor;
  final double? offsetX;
  final double? offsetY;
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
    this.shadowColor,
    this.offsetX,
    this.offsetY,
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
        height: height * (buttonHeight ?? 0.055),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(scaleFactor * (radius ?? 12)),
          border: Border.all(color: borderColor ?? AppColors.zuccini, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColors.zuccini,
              offset: Offset(offsetX ?? 2, offsetY ?? 3),
              blurRadius: 0,
            ),
          ],
        ),
        child: CustomText(
          text: title,
          textAlign: TextAlign.center,
          textOverflow: TextOverflow.clip,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: fontColor ?? AppColors.white,
          isKoulen: true,
        ),
      ),
    );
  }
}
