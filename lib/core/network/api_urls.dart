import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final baseUrl = dotenv.env['baseUrl'];
  static final signUp = "$baseUrl/auth/signup";

  static String bookBySubjectId(String id) => "$baseUrl/books/$id";

}
