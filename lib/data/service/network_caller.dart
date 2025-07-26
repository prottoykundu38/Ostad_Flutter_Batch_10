import 'dart:convert';

import 'package:http/http.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse(
      {required this.isSuccess,
      required this.statusCode,
      this.body,
      this.errorMessage});
}

class NetworkCaller {
  static const String _defaultErrorMessage = 'Something Went Wrong';
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);

      if (response.statusCode == 200) {
        final decodedjsone = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjsone,
        );
      } else {
        final decodedjsone = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            body: decodedjsone,
            errorMessage: decodedjsone['data'] ?? _defaultErrorMessage);
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, String>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );

      final decodedJson = jsonDecode(response.body);

      return NetworkResponse(
        isSuccess: response.statusCode == 200 &&
            decodedJson['status']?.toString().toLowerCase() == 'success',
        statusCode: response.statusCode,
        body: decodedJson,
        errorMessage: decodedJson['data']?.toString() ?? _defaultErrorMessage,
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}
