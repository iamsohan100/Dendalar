import 'dart:async';
import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/feature/splash/controllers/connection_checker_controller.dart';
import 'package:dendalar/feature/splash/pages/no_internet_page.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final connection = Get.find<ConnectionCheckerController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _initializeSharePreference();
      ever(connection.hasInternet, (bool hasInternet) {
        if (hasInternet && mounted) {
          _routeNextPage();
        }
      });
    });
  }

  // Future<void> _initializeSharePreference() async {
  //   await AuthPreference().initializeToken();
  //   await OnBoardingPreference().initializeOnBoarding();
  // }

  void _routeNextPage() {
    Timer(Duration(seconds: 1), () {
      Get.offAllNamed(AppRoutes.onboardingPage1);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    return Obx(() {
      if (!connection.hasInternet.value) {
        return NoInternetPage();
      }
      return Scaffold(
        body: Image.asset(
          AppImages.splash,
          width: width,
          height: height,
          fit: .cover,
        ),
      );
    });
  }
}
