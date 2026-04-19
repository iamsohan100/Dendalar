import 'package:flutter/material.dart';

class Screen {
  static double designHeight = 956;
  static double designWidth = 440;

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}