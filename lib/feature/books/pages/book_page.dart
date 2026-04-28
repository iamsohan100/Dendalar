import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        Get.find<DashboardController>().changeIndex(index: 0);
      },
      child: Scaffold(
        body: Background(
          child: Column(
            children: [
              CustomAppBar(isMain: true),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      Sh(h: 0.12),
                      Image.asset(AppImages.createProfile, scale: 4),
                      Sh(h: 0.025),
                      CustomText(
                        text: 'COMING SOON',
                        color: AppColors.blackout,
                        fontSize: 32,
                        fontWeight: .w400,
                        isKoulen: true,
                      ),
                      Sh(h: 0.01),
                      CustomText(
                        text:
                            'You’ll get list of books based on your language \nselection once we publish',
                        color: AppColors.darkGreyishBrown,
                        fontSize: 14,
                        fontWeight: .w400,
                        textAlign: TextAlign.center,
                      ),
                      Sh(h: 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
