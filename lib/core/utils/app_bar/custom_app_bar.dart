import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/navigation_back.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isMain});
  final bool? isMain;
  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    final scaleFactor = width / Screen.designWidth;
    // final height = Screen.screenHeight(context);
    return Padding(
      padding: EdgeInsets.only(
        left: scaleFactor * 14,
        right: scaleFactor * 14,
        bottom: scaleFactor * 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImages.logo, scale: 5),

          Spacer(),
          NavigationBack(isMain: isMain),
        ],
      ),
    );
  }
}
