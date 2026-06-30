import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/form_field/custom_form_field.dart';
import 'package:dendalar/core/utils/message/bottom_message.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:dendalar/feature/profile/widgets/edit_profile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final profileData = profileController.profileModel.value.data;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.nameController.text = profileData?.name ?? '';
      profileController.emailController.text = profileData?.auth?.email ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.inProgress.value) {
        return EditProfileShimmer();
      }
      return Form(
        key: _formKey,
        child: Column(
          children: [
            Sh(h: 0.03),
            CustomFormField(
              controller: profileController.nameController,
              title: 'Username',
              hintText: 'Enter username',
              prefixIcon: Image.asset(AppIcons.username, scale: 3),
              suffixIcon: Image.asset(AppIcons.edit, scale: 3),
            ),
            Sh(h: 0.02),
            CustomFormField(
              onTap: () {
                bottomMessage(msg: "You can't edit your email address.");
              },
              controller: profileController.emailController,
              title: 'Email',
              hintText: 'Enter email address',
              prefixIcon: Image.asset(AppIcons.email, scale: 3),
              readOnly: true,
              fontColor: AppColors.chalice,
            ),
            Sh(h: 0.04),
            PrimaryButton(onTap: saveChanges, title: 'SAVE CHANGES'),
          ],
        ),
      );
    });
  }

  void saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final response = await profileController.updateProfile(context);
      if (response) {
        bottomMessage(msg: 'Name changed successfully.');
      }
    }
  }
}
