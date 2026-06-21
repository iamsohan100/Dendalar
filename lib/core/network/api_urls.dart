import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final baseUrl = dotenv.env['baseUrl'];
  static final registration = "$baseUrl/auths/signup";
  static final verifyAccount = "$baseUrl/otps/verify";
  static final resendAccountVerifyOtp = "$baseUrl/otps/send";
  static final login = "$baseUrl/auths/login";
  static final passReset = "$baseUrl/auths/reset-password";
  static final getProfile = "$baseUrl/profile";
  static final changePass = "$baseUrl/auths/change-password";
  static final levels = "$baseUrl/levels";

  static String getChapter(String id) => "$baseUrl/chapters?levelId=$id";


}
