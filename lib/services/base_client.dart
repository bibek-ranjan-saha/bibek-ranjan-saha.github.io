import 'package:http/http.dart' as http;

class Api{
  static final http.Client _httpClient = http.Client();
  static http.Client get client => _httpClient;
}