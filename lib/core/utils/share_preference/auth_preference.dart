import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {
  static String? userToken;

  String key = 'token';

  Future<void> saveLoginToken({required String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(key, token);

    userToken = token;
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  Future<void> initializeToken() async {
    userToken = await _getToken();
  }

  Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
    userToken = null;
  }
}
