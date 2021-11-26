import 'package:http/http.dart';

abstract class SelfiProvider {
  Future<Response> getSessionToken(String token);
  Future<Response> getIsEnrolled(String sessionToken);
  Future<Response> getInfoPerson(
      bool flagEnrollment, String templateRaw, String sessionToken);
}
