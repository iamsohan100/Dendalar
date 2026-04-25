import 'package:dendalar/feature/onboarding/pages/onboarding_page_1.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_2.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_3.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_4.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_5.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_6.dart';
import 'package:dendalar/feature/splash/pages/splash_page.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboardingPage1,
      page: () => const OnboardingPage1(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboardingPage2,
      page: () => const OnboardingPage2(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboardingPage3,
      page: () => const OnboardingPage3(),
      transition: Transition.fadeIn,
    ),
     GetPage(
      name: AppRoutes.onboardingPage4,
      page: () => const OnboardingPage4(),
      transition: Transition.fadeIn,
    ),
     GetPage(
      name: AppRoutes.onboardingPage5,
      page: () => const OnboardingPage5(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboardingPage6,
      page: () => const OnboardingPage6(),
      transition: Transition.fadeIn,
    ),
  ];
}
