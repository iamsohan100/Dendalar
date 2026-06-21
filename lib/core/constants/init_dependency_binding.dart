import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:dendalar/feature/forget/controller/forget_controller.dart';
import 'package:dendalar/feature/login/controller/login_controller.dart';
import 'package:dendalar/feature/main_course/controller/chapter_controller.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/controller/main_course_controller.dart';
import 'package:dendalar/feature/onboarding/controllers/onboarding_6_controller.dart';
import 'package:dendalar/feature/profile/controller/change_password_controller.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:dendalar/feature/splash/controllers/connection_checker_controller.dart';
import 'package:dendalar/feature/main_course/controller/sentence_match_controller.dart';
import 'package:get/get.dart';

class InitDependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(ProfileController());
    Get.put(ConnectionCheckerController());
    Get.put(MainCourseController());
    Get.lazyPut(() => SentenceMatchController(), fenix: true);
    Get.lazyPut(() => DialogMatchController(), fenix: true);
    Get.lazyPut(() => RegistrationController(), fenix: true);
    Get.lazyPut(() => Onboarding6Controller(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgetController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => ChapterController(), fenix: true);
  }
}
