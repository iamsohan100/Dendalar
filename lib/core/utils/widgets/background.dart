import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child, this.backgroundImage});
  final Widget child;
  final String? backgroundImage;
  @override
  Widget build(BuildContext context) {
    final height = Screen.screenHeight(context);
    final width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(backgroundImage ?? AppImages.background),
          fit: BoxFit.cover,
          opacity: backgroundImage != null ? 1 : 0.2,
        ),
      ),

      child: SafeArea(
        child: Padding(padding: .all(scaleFactor * 20), child: child),
      ),
    );
  }
}
