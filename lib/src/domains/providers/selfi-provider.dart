import 'package:http/http.dart';

abstract class SelfiProvider {
  Future<Response> getOAuth(
    // String resource,
  );
  Future<Response> getSessionToken(
    String token,
    String trackingId, 
    String oauth,
  );
  Future<Response> getIsEnrolled(
    String sessionToken,
    String trackingId,
    String oauth,
  );
  Future<Response> getInfoPerson(
    bool flagEnrollment,
    String templateRaw,
    String selphiBestImage,
    String sessionToken,
    String trackingId,
    String oauth,
  );
}
