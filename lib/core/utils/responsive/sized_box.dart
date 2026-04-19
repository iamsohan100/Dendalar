// height
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:flutter/material.dart';

class Sh extends StatelessWidget {
  const Sh({super.key, required this.h});
  final double h;
  @override
  Widget build(BuildContext context) {
    final height = Screen.screenHeight(context);
    return SizedBox(height: height * h);
  }
}

// width
class Sw extends StatelessWidget {
  const Sw({super.key, required this.w});
  final double w;
  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    return SizedBox(width: width * w);
  }
}
