import 'package:get/get.dart';

class DashboardController extends GetxController {
  final curentIndex = 0.obs;
  void changeIndex({required int index}) {
    if (index != curentIndex.value) {
      curentIndex.value = index;
    }
  }
}