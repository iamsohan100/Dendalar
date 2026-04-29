import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/controller/main_course_controller.dart';
import 'package:dendalar/feature/main_course/widgets/level_locked_dialog.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCoursePage extends StatelessWidget {
  const MainCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final mainCourseController = Get.find<MainCourseController>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          Obx(
            () => PrimaryButton(
              onTap: () {
                if (mainCourseController.currentLevel.value > 0) {
                  levelLockedDialog(context: context);
                } else {
                  Get.toNamed(AppRoutes.stagePage);
                }
              },
              title: 'START LEVEL A${mainCourseController.currentLevel.value}',
            ),
          ),
          Sh(h: 0.01),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Sh(h: 0.01),
              Image.asset(AppImages.logo, scale: 4),
              Sh(h: 0.03),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(width: width, height: height * 0.65),
                  SizedBox(
                    width: width * 0.7,
                    height: height * 0.65,
                    child: PageView.builder(
                      controller: mainCourseController.pageController,
                      onPageChanged: mainCourseController.onPageChanged,
                      itemCount: mainCourseController.maxLevel + 1,
                      itemBuilder: (context, index) {
                        return Image.asset(AppImages.level);
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: mainCourseController.nextLevel,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.darkSilver,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: mainCourseController.previousLevel,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.darkSilver,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Sh(h: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
