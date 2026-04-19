import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final height = Screen.screenHeight(context);
    final width = Screen.screenWidth(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: AppColors.white),
      child: SafeArea(child: Padding(padding: EdgeInsets.all(16), child: child)),
    );
  }
}
