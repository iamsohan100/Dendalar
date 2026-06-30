import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ChapterDivider extends StatelessWidget {
  const ChapterDivider({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      spacing: 10,
      children: [
        Expanded(child: Image.asset(AppImages.leftDivider)),
        CustomText(
          text: name,
          color: AppColors.primaryColor,
          fontSize: 29,
          fontWeight: .w400,
          isKoulen: true,
        ),
        Expanded(child: Image.asset(AppImages.rightDivider)),
      ],
    );
  }
}
