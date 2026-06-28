import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/profile/controller/privacy_about_controller.dart';
import 'package:dendalar/feature/profile/widgets/reset_level_dialog.dart';
import 'package:dendalar/feature/profile/widgets/setting_button.dart';
import 'package:dendalar/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final privacyAboutController = Get.find<PrivacyAboutController>();
    return Column(
      spacing: height * 0.015,
      children: [
        Sh(h: 0.015),
        SettingButton(
          onTap: () {
            resetLevelDialog(context: context);
          },
          icon: Icons.arrow_forward_ios,
          image: AppIcons.resetLevel,
          title: 'Reset Level',
          imageScale: 4,
        ),
        SettingButton(
          onTap: () async {
            final response = await privacyAboutController.getPrivacyAbout(
              context,
            );
            if (response) {
              Get.toNamed(AppRoutes.privacyPolicyPage);
            }
          },
          icon: Icons.arrow_forward_ios,
          image: AppIcons.privacyPolicy,
          title: 'Privacy Policy',
          imageScale: 3,
        ),
        SettingButton(
          onTap: () async {
            final response = await privacyAboutController.getPrivacyAbout(
              context,
            );
            if (response) {
              Get.toNamed(AppRoutes.aboutUsPage);
            }
          },
          icon: Icons.arrow_forward_ios,
          image: AppIcons.aboutUs,
          title: 'About Us',
          imageScale: 3,
        ),
      ],
    );
  }
}
