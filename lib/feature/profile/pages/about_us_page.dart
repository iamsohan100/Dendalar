import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';

import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/profile/controller/privacy_about_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    // double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final privacyAboutController = Get.find<PrivacyAboutController>();
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() {
                  final data =
                      privacyAboutController.privacyAboutModel.value.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Html(data: data?.aboutUs ?? '')],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
