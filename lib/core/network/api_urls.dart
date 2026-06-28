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
  static final activeLesson = "$baseUrl/profile/active-lesson";
  static final activeLevel = "$baseUrl/profile/active-level";
  static final resetLevel = "$baseUrl/profile/reset-level";
  static final privacyAbout = "$baseUrl/legal";

  static String getChapter(String id) => "$baseUrl/chapters?levelId=$id";
  static String getSentenceQuestion(String lessonId) =>
      "$baseUrl/questions/lesson/$lessonId?page=1&limit=1000";

  static String getDialogQuestion(String lessonId, int page) =>
      "$baseUrl/questions/lesson/$lessonId?page=$page&limit=4";
}
