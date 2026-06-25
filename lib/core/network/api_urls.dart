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
  static final activeQuestion = "$baseUrl/profile/active-question";

  static String getChapter(String id) => "$baseUrl/chapters?levelId=$id";
  static String getSentenceQuestion(String lessonId) =>
      "$baseUrl/questions/lesson/$lessonId?page=1&limit=1000";
}
