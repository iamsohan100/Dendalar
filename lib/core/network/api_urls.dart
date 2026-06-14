import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final baseUrl = dotenv.env['baseUrl'];
  static final registration = "$baseUrl/auths/signup";
  static final verifyAccount = "$baseUrl/otps/verify";
  static final resendAccountVerifyOtp = "$baseUrl/otps/send";

  static String bookBySubjectId(String id) => "$baseUrl/books/$id";

}
