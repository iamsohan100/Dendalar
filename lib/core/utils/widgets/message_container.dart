import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.msg,
    this.maxWidth,
    this.triangleRightPadding,
    this.rightMargin,
  });
  final String msg;
  final double? maxWidth;
  final double? triangleRightPadding;
  final double? rightMargin;
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: Alignment.centerRight,

      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        alignment: .center,
        children: [
          Container(
            padding: EdgeInsets.all(scaleFactor * 12),
            margin: EdgeInsets.only(right: width * (rightMargin ?? 0.19)),
            constraints: BoxConstraints(
              minWidth: width * 0.3,
              maxWidth: width * (maxWidth ?? 0.4),
            ),
            decoration: BoxDecoration(
              color: AppColors.kaitokeGreen,
              borderRadius: BorderRadius.circular(scaleFactor * 12),
            ),
            alignment: Alignment.center,
            child: CustomText(
              text: msg,
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Positioned(
            bottom: -8,
            right: width * (triangleRightPadding ?? 0.4),
            child: Image.asset(
              AppIcons.triangle,
              scale: 4,
              color: AppColors.kaitokeGreen,
            ),
          ),
        ],
      ),
    );
  }
}
