import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MessageContainer2 extends StatelessWidget {
  const MessageContainer2({super.key, required this.msg, this.maxWidth});
  final String msg;
  final double? maxWidth;
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
          Positioned(
            left: -7,
            child: Image.asset(
              AppIcons.triangle2,
              scale: 4,
              color: AppColors.kaitokeGreen,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: scaleFactor * 14,
              vertical: scaleFactor * 10,
            ),
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
        ],
      ),
    );
  }
}
