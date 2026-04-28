import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/text/custom_text.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSectionButton extends StatelessWidget {
  const ProfileSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    final profileController = Get.find<ProfileController>();
    GestureDetector button({
      required String title,
      required VoidCallback onTap,
      required bool isSelected,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
            bottom: height * 0.01,
            right: width * 0.07,
            left: width * 0.07,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,

            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: title,
            color: isSelected ? AppColors.primaryColor : AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            isManrope: true,
          ),
        ),
      );
    }

    return Column(
      children: [
        Obx(() {
          return Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              button(
                onTap: () {
                  profileController.editProfile.value = true;
                  profileController.changePass.value = false;
                  profileController.setting.value = false;
                },
                title: 'Edit Profile',
                isSelected: profileController.editProfile.value,
              ),
              button(
                onTap: () {
                  profileController.editProfile.value = false;
                  profileController.changePass.value = true;
                  profileController.setting.value = false;
                },
                title: 'Change Password',
                isSelected: profileController.changePass.value,
              ),
              button(
                onTap: () {
                  profileController.editProfile.value = false;
                  profileController.changePass.value = false;
                  profileController.setting.value = true;
                },
                title: 'Settings',
                isSelected: profileController.setting.value,
              ),
            ],
          );
        }),
        Container(
          width: width,
          height: height * 0.002,
          decoration: BoxDecoration(
            color: AppColors.sportyWhite,
            borderRadius: BorderRadius.circular(scaleFactor * 4),
          ),
        ),
      ],
    );
  }
}
