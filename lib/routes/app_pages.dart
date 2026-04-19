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
  ];
}
