import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key, required this.children});

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return SafeArea(
      bottom: true,
      top: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.all(scaleFactor * 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}
