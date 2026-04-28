import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBack extends StatelessWidget {
  const NavigationBack({super.key, this.isMain});
  final bool? isMain;

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    final scaleFactor = width / Screen.designWidth;
    // final height = Screen.screenHeight(context);
    return GestureDetector(
      onTap: () {
        if (isMain == true) {
          Get.find<DashboardController>().changeIndex(index: 0);
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(scaleFactor * 2),
        decoration: BoxDecoration(color: AppColors.transparent, shape: .circle),
        alignment: Alignment.center,
        child: Row(
          children: [
            Image.asset(AppIcons.arrowBack, scale: 3.5),
            Sw(w: 0.015),
            CustomText(
              text: 'Back',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: .w500,
              lineHeight: 0,
              isPoppins: true,
            ),
          ],
        ),
      ),
    );
  }
}
