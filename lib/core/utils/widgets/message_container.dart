
import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, required this.msg, this.maxWidth});
  final String msg;
  final double? maxWidth;
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.01,
            ),
            margin: EdgeInsets.only(
              right: width * 0.17,
              bottom: height * 0.017,
            ),
            constraints: BoxConstraints(
              minWidth: width * 0.3,
              maxWidth: width * (maxWidth ?? 0.45),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(scaleFactor * 14),
            ),
            alignment: Alignment.center,
            child: CustomText(
              text: msg,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Positioned(
            bottom: 0,
            left: width * 0.02,
            child: Image.asset(AppIcons.triangle, scale: 4),
          ),
        ],
      ),
    );
  }
}
