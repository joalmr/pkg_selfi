import 'package:http/http.dart' as http;

class ProviderService {
  Future<http.Response> generaToken() async {
    // https://apimgmt-pacificodesa.azure-api.net/ne-opera-token-pga/identificacion-biometrica/v1/token
    final String baseUrl = 'apimgmt-pacificodesa.azure-api.net';
    final String pathUrl =
        'ne-opera-token-pga/identificacion-biometrica/v1/token';

    final url = Uri.https(baseUrl, pathUrl);

    return http.post(
      url,
      headers: {
        'correlationId': 'corr',
        'Application-Id': '1',
        'Ocp-Apim-Subscription-Key': '926ec90111ea4d3bb44699fa01f01c1b',
        'Cookie':
            'fpc=AoxLMklE38FNsgVeuEVr0PXzV-iIAQAAAFt8ydgOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        "documentNumber": "46790906",
        "documentType": "01",
        "ttl": "300",
        "type": "access"
      },
    );
  }
}
