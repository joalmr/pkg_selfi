import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<http.Response> get(String urlBase, String ruta,
      {Map<String, String>? headers}) async {
    final url = Uri.https(urlBase, ruta);
    final response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> post(String urlBase, String ruta,
      {Map<String, String>? headers, Object? body}) async {
    final url = Uri.https(urlBase, ruta);
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> put(String urlBase, String ruta,
      {Map<String, String>? headers, Object? body}) async {
    final url = Uri.https(urlBase, ruta);
    final response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> delete(String urlBase, String ruta,
      {Map<String, String>? headers, Object? body}) async {
    final url = Uri.https(urlBase, ruta);
    final response =
        await http.delete(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  path() {}
}
