import 'package:dendalar/feature/onboarding/pagees/onboarding_page_1.dart';
import 'package:dendalar/feature/onboarding/pagees/onboarding_page_2.dart';
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
  ];
}
