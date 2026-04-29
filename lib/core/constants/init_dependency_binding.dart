
import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:dendalar/feature/main_course/controller/main_course_controller.dart';
import 'package:dendalar/feature/profile/controller/profile_controller.dart';
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
    
  }
}
