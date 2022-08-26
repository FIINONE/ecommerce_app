import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app/common/network/network.dart';
import 'package:http/http.dart' as http;

class ApiRouter {
  static final instance = ApiRouter._();
  ApiRouter._();

  Future<AppHttpResponse> sendRequest({
    required String path,
  }) async {
    const String host = HttpPath.host;

    final client = http.Client();

    final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};

    final uri = Uri.https(host, path);

    try {
      final response = await client.get(
        uri,
        headers: headers,
      );

      log('╔════Network: Response═══───');
      log('║ request.uri ${host + path}');
      log('║ request.headers $headers');
      log('╠════════Response════════───');
      log('║ response.code ${response.statusCode}');
      log('║ response.data ${jsonDecode(response.body)}');
      log('╚═══════════════════════───');

      ///
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AppHttpResponse(
          statusCode: response.statusCode,
          map: jsonDecode(response.body),
          headers: response.headers,
        );
      }

      log('╔════Network: Error═══───');
      log('║ request.headers $headers');
      log('║ request.uri ${host + path}');
      log('╠════════Error════════───');
      log('║ response.code ${response.statusCode}');
      log('║ response.data ${jsonDecode(response.body)}');
      log('╚═══════════════════════───');

      throw HttpException(
        statusCode: response.statusCode,
        map: jsonDecode(response.body),
      );
    } catch (e) {
      log('╔════Network: Error═══───');
      log('║ request.headers $headers');
      log('║ request.uri ${host + path}');
      log('╠════════Error════════───');
      log('║ $e');
      log('╚═══════════════════════───');
      rethrow;
    }
  }
}
