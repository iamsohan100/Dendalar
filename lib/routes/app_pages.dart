import 'package:dendalar/feature/login/pages/forget_password_page.dart';
import 'package:dendalar/feature/login/pages/login_page.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_1.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_2.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_3.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_4.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_5.dart';
import 'package:dendalar/feature/onboarding/pages/onboarding_page_6.dart';
import 'package:dendalar/feature/registration/pages/age_page.dart';
import 'package:dendalar/feature/registration/pages/complete_profile_page.dart';
import 'package:dendalar/feature/registration/pages/congratulation_page.dart';
import 'package:dendalar/feature/registration/pages/create_profile_page.dart';
import 'package:dendalar/feature/registration/pages/email_page.dart';
import 'package:dendalar/feature/registration/pages/name_page.dart';
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
    GetPage(
      name: AppRoutes.createProfilePage,
      page: () => const CreateProfilePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.agePage,
      page: () => const AgePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.namePage,
      page: () => const NamePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.emailPage,
      page: () => const EmailPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.completeProfilePage,
      page: () => const CompleteProfilePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.congratulationPage,
      page: () => const CongratulationPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    
    GetPage(
      name: AppRoutes.forgetPasswordPage,
      page: () => const ForgetPasswordPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
