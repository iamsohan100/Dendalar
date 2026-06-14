import 'dart:ui';
import 'package:dendalar/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';

dynamic mainLoading(BuildContext context) {
  double width = Screen.screenWidth(context);
  double scaleFactor = width / Screen.designWidth;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: PopScope(
          canPop: false,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: scaleFactor * 10,
                horizontal: scaleFactor * 14,
              ),
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(scaleFactor * 14),
              ),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(color: AppColors.white, size: scaleFactor * 50),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
