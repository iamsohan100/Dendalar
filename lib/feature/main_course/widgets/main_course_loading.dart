import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/loading/circle_loading.dart';
import 'package:dendalar/core/utils/loading/shimmer_loading.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';

class MainCourseLoading extends StatelessWidget {
  const MainCourseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          ShimmerLoading(width: width, height: height * 0.0555),
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
                    child: CircleLoading(),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
