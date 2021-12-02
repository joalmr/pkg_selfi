import 'dart:developer';

import 'package:http/src/response.dart';
import 'package:pkg_selfi/src/domains/providers/selfi-provider.dart';
import 'package:pkg_selfi/src/libs/provider/api-provider.dart';

class SelfiProviderService extends SelfiProvider {
  final ApiProvider api = ApiProvider();

  @override
  Future<Response> getSessionToken(String token) {
    return api.post(
      "apimgmt-pacificodesa.azure-api.net",
      "ux-opera-token-pga/identificacion-biometrica/v1/token/session",
      headers: {
        'Ocp-Apim-Subscription-Key':
            '926ec90111ea4d3bb44699fa01f01c1b;product=ibiometria-producto',
        'correlationId': '123454364636',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {"access-token": token},
    );
  }

  @override
  Future<Response> getIsEnrolled(String sessionToken) {
    return api.get("apimgmt-pacificodesa.azure-api.net",
        "ux-biom-enrolamiento-persona-pga/identificacion-biometrica/v1/person/enrollment",
        headers: {
          'Session-token': sessionToken,
          'Ocp-Apim-Subscription-Key': '926ec90111ea4d3bb44699fa01f01c1b',
          'correlationId': '1234',
          'Cookie':
              'fpc=AoxLMklE38FNsgVeuEVr0PXzV-iIAQAAAFt8ydgOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AqVQl-yQSW5FhXNjmWacz8_zV-iIAQAAAFv0HdkOAAAA',
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }

  @override
  Future<Response> getInfoPerson(
    bool flagEnrollment,
    String templateRaw,
    String sessionToken,
  ) {
    print('=====> templateRaw');

    print(templateRaw);
    log(templateRaw);

    return api.post(
      "apimgmt-pacificodesa.azure-api.net",
      "ux-valida-informacion-persona-pga/identificacion-biometrica/v1/person",
      headers: {
        'Session-token': sessionToken,
        'correlationId': '132323213',
        'Cookie':
            'fpc=AoxLMklE38FNsgVeuEVr0PXzV-iIAQAAAFt8ydgOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        "flagEnrollment": flagEnrollment,
        "templateRaw": templateRaw,
      },
    );
  }
}
