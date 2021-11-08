import 'package:http/http.dart';

abstract class SelfiProvider {
  Future<Response> getSessionToken(String token);
}
