class ApiUrls {
  static final baseUrl = 'http://10.10.10.17:5002/api/v1';
  static final signUp = "$baseUrl/users/signup";

  static String questions(String id) => "$baseUrl/questions/$id";
}
