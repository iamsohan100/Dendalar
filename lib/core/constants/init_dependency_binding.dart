import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:dendalar/feature/forget/controller/forget_controller.dart';
import 'package:dendalar/feature/login/controller/login_controller.dart';
import 'package:dendalar/feature/main_course/controller/active_lesson_controller.dart';
import 'package:dendalar/feature/main_course/controller/active_level_controller.dart';
import 'package:dendalar/feature/main_course/controller/active_question_controller.dart';
import 'package:dendalar/feature/main_course/controller/chapter_and_lesson_controller.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/controller/main_course_controller.dart';
import 'package:dendalar/feature/main_course/controller/reset_level_controller.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:dendalar/feature/main_course/controller/summary_lesson_controller.dart';
import 'package:dendalar/feature/onboarding/controllers/onboarding_6_controller.dart';
import 'package:dendalar/feature/profile/controller/change_password_controller.dart';
import 'package:dendalar/feature/profile/controller/privacy_about_controller.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
import 'package:dendalar/feature/registration/controller/registration_controller.dart';
import 'package:dendalar/feature/splash/controllers/connection_checker_controller.dart';
import 'package:get/get.dart';

class InitDependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(ProfileController());
    Get.put(ConnectionCheckerController());
    Get.put(MainCourseController());
    Get.lazyPut(() => DialogMatchController(), fenix: true);
    Get.lazyPut(() => RegistrationController(), fenix: true);
    Get.lazyPut(() => Onboarding6Controller(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgetController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => ChapterAndLessonController(), fenix: true);
    Get.lazyPut(() => SentenceQuestionController(), fenix: true);
    Get.lazyPut(() => ActiveLessonController(), fenix: true);
    Get.lazyPut(() => ActiveQuestionController(), fenix: true);
    Get.lazyPut(() => ActiveLevelController(), fenix: true);
    Get.lazyPut(() => SummaryLessonController(), fenix: true);
    Get.lazyPut(() => ResetLevelController(), fenix: true);
    Get.lazyPut(() => PrivacyAboutController(), fenix: true);
  }
}
