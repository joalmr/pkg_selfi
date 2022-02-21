import 'dart:developer';

import 'package:http/src/response.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider.dart';
import 'package:pkg_selfi/src/libs/provider/api-provider.dart';

class SelfiProviderService extends SelfiProvider {
  final ApiProvider api = ApiProvider();

  //nuevo
  @override
  Future<Response> getOAuth(String resource) {
    return api.post(
      "apimgmt-pacificodesa.azure-api.net",
      "pga-tokens/soporte-ti/v2/tokens",
      headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': '2b9fc885c0f74700b0799391668d0888',
        'clientcredential': 'NWRjNWM1YjAtNjViNy00ZmRlLWFlZGYtNDA2ZjVmNGI3MjQ2OlN1SDdRfk5ZNUhkaFNxZkZsRkZnbjJVWktySXNkQlY0MHZTNmQK',
        'Cookie': 'fpc=AlFU38bzw3hJugpi1gU5-mb0yNhRAQAAAFXQoNkOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd'
      },
      body: {"resource": resource},
    );
  }

  @override
  Future<Response> getSessionToken(String token, String trackingId, String oauth) {
    return api.post(
      "apimgmt-pacificodesa.azure-api.net",
      "ux-opera-token-pga/identificacion-biometrica/v1/token/session",
      headers: {
        'Authorization':'Bearer $oauth',
        'Ocp-Apim-Subscription-Key':
            '926ec90111ea4d3bb44699fa01f01c1b;product=ibiometria-producto',
        'correlationId': '123454364636',
        'Content-Type': 'application/json; charset=UTF-8',
        'Device-Id': 'mobile',
        'Tracking-Id': trackingId,
        'Application-Id': '1',
      },
      body: {"access-token": token},
    );
  }

  @override
  Future<Response> getIsEnrolled(String sessionToken, String trackingId, String oauth) {
    return api.get("apimgmt-pacificodesa.azure-api.net",
        "ux-biom-enrolamiento-persona-pga/identificacion-biometrica/v1/person/enrollment",
        headers: {
          'Authorization':'Bearer $oauth',
          'Session-token': sessionToken,
          'Ocp-Apim-Subscription-Key': '926ec90111ea4d3bb44699fa01f01c1b',
          'correlationId': '1234',
          'Cookie':
              'fpc=AoxLMklE38FNsgVeuEVr0PXzV-iIAQAAAFt8ydgOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AqVQl-yQSW5FhXNjmWacz8_zV-iIAQAAAFv0HdkOAAAA',
          'Content-Type': 'application/json; charset=UTF-8',
          'Device-Id': 'mobile',
          'Tracking-Id': trackingId,
        });
  }

  @override
  Future<Response> getInfoPerson(
    bool flagEnrollment,
    String templateRaw,
    String sessionToken,
    String trackingId,
    String selphiBestImage,
    String oauth,
  ) {
    return api.post(
      "apimgmt-pacificodesa.azure-api.net",
      "ux-valida-informacion-persona-pga/identificacion-biometrica/v1/person",
      headers: {
        'Authorization':'Bearer $oauth',
        'Session-token': sessionToken,
        'correlationId': '132323213',
        'Device-Id': 'mobile',
        'Tracking-Id': trackingId,
        'Content-Type': 'application/json; charset=UTF-8',
        'Ocp-Apim-Subscription-Key': '926ec90111ea4d3bb44699fa01f01c1b',
      },
      body: {
        "flagEnrollment": flagEnrollment,
        "templateRaw": templateRaw,
        "selphiBestImage": selphiBestImage,
      },
    );
  }
  
}
