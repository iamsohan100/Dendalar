import 'package:dendalar/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.white,
      primary: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.white,
  );
}
