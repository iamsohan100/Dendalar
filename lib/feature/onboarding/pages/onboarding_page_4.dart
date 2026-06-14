import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/onboarding/widgets/board_4_message.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_card.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
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
    final registrationController = Get.find<RegistrationController>();
    final cardsData = [
      {'title': 'JUST FOR FUN', 'icon': AppIcons.fun},
      {'title': 'BOOST CAREER', 'icon': AppIcons.career},
      {'title': 'CONNECT WITH PEOPLE', 'icon': AppIcons.people},
      {'title': 'HIGHER EDUCATION', 'icon': AppIcons.education},
      {'title': 'OTHER'},
    ];
    final selectedIndex = (-1).obs;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OnboardingButtons(
        children: [
          PrimaryButton(onTap: _continue, title: 'Continue'),
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
              Board4Message(
                msg: "Why do you want to learn Chechen language?",
                messageMaxWidth: 0.65,
              ),
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
                        registrationController.purpose.value = card['title']!.replaceAll(' ', '_');
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

void _continue() {
  final registrationController = Get.find<RegistrationController>();
  if (registrationController.purpose.value.isEmpty) {
    bottomMessage(msg: "Please select an option");
  } else {
    Get.toNamed(AppRoutes.onboardingPage5);
  }
}
