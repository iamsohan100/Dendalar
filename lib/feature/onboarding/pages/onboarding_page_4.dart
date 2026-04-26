import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_card.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final cardsData = [
      {'title': 'Just for fun', 'icon': AppIcons.fun},
      {'title': 'Boost my Career', 'icon': AppIcons.career},
      {'title': 'Connect with people', 'icon': AppIcons.people},
      {'title': 'Higher education', 'icon': AppIcons.education},
      {'title': 'Other'},
    ];
    final selectedIndex = (-1).obs;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(
            onTap: () => Get.toNamed(AppRoutes.onboardingPage5),
            title: 'Continue',
          ),
          Sh(h: 0.01),
          PrimaryButton(
            onTap: () => Navigator.pop(context),
            title: 'Back',
            fontColor: AppColors.blackout,
            backgroundColor: AppColors.transparent,
            borderColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            isManjari: true,
          ),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Sh(h: 0.035),
              Image.asset(AppImages.logo, scale: 4),
              Sh(h: 0.045),
              Board4Message(),
              Sh(h: 0.05),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cardsData.length,
                itemBuilder: (context, index) {
                  final card = cardsData[index];
                  return Obx(
                    () => OnboardingCard(
                      onTap: () {
                        selectedIndex.value = index;
                      },
                      title: card['title']!,
                      icon: card['icon'],
                      isSelected: selectedIndex.value == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Sh(h: 0.016);
                },
              ),
              Sh(h: 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
