import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPreference {
  static bool? isOnBoarding;

  String key = 'on_boarding';

  Future<void> saveOnBoarding({required bool onBoarding}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setBool(key, onBoarding);

    isOnBoarding = onBoarding;
  }

  Future<bool?> _getOnBoarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }

  Future<void> initializeOnBoarding() async {
    isOnBoarding = await _getOnBoarding();
  }
}
