import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:dendalar/feature/profile/widgets/change_pass.dart';
import 'package:dendalar/feature/profile/widgets/edit_profile.dart';
import 'package:dendalar/feature/profile/widgets/profile_section_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    final profileController = Get.find<ProfileController>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        Get.find<DashboardController>().changeIndex(index: 0);
      },
      child: Scaffold(
        body: Background(
          isPaddingZero: true,
          child: Column(
            children: [
              Padding(
                padding: .only(
                  left: scaleFactor * 20,
                  right: scaleFactor * 20,
                  top: scaleFactor * 16,
                ),
                child: CustomAppBar(isMain: true),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      Padding(
                        padding: .symmetric(horizontal: scaleFactor * 20),
                        child: Column(
                          children: [
                            Sh(h: 0.01),
                            Image.asset(AppImages.onboardingPage1, scale: 5),
                            Sh(h: 0.01),
                            CustomText(
                              text: 'EDIT PROFILE DETAILS',
                              color: AppColors.blackout,
                              fontSize: 32,
                              fontWeight: .w400,
                              isKoulen: true,
                            ),
                            Sh(h: 0.002),
                            CustomText(
                              text:
                                  'Change or update your basic profile details',
                              color: AppColors.darkGreyishBrown,
                              fontSize: 14,
                              fontWeight: .w400,
                              textAlign: TextAlign.center,
                            ),
                            Sh(h: 0.04),
                          ],
                        ),
                      ),
                      ProfileSectionButton(),
                      Padding(
                        padding: .symmetric(horizontal: scaleFactor * 20),
                        child: Obx(() {
                          return Column(
                            children: [
                              if (profileController.editProfile.value)
                                EditProfile(),
                              if (profileController.changePass.value)
                                ChangePass(),
                            ],
                          );
                        }),
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
