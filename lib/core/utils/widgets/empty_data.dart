import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String? title;
  final String? description;
  final IconData? icon;
  final double? topMargin;
  final double? bottomMargin;
  const EmptyData({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.topMargin, this.bottomMargin,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = Screen.screenWidth(context);
    double scaleFactor = screenWidth / Screen.designWidth;

    return Align(
      alignment: .center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Sh(h: topMargin ?? 0),
          if (icon != null)
            Container(
              padding: EdgeInsets.all(scaleFactor * 20),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.4),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.darkGreyishBrown.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                size: scaleFactor * 54,
                color: AppColors.blackGrape,
              ),
            ),

          Sh(h: 0.025),

          // Title
          if (title != null)
            CustomText(
              text: title!,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blackout,
              textAlign: TextAlign.center,
              isManrope: true,
            ),

          if (description != null) ...[
            Sh(h: 0.01),
            CustomText(
              text: description!,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGreyishBrown,
              textAlign: TextAlign.center,
              maxLine: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
          Sh(h: bottomMargin ?? 0),
        ],
      ),
    );
  }
}
