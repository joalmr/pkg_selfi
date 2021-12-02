import 'package:http/http.dart';

abstract class SelfiProvider {
  Future<Response> getSessionToken(
    String token,
    String trackingId,
  );
  Future<Response> getIsEnrolled(
    String sessionToken,
    String trackingId,
  );
  Future<Response> getInfoPerson(
    bool flagEnrollment,
    String templateRaw,
    String sessionToken,
    String trackingId,
  );
}
