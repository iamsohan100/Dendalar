
import 'package:dendalar/feature/splash/controllers/connection_checker_controller.dart';
import 'package:get/get.dart';

class InitDependencyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(MainController());
    Get.put(ConnectionCheckerController());

    // Get.lazyPut(() => ChangeProfileInfoController(), fenix: true);
    
  }
}
