import 'dart:async';

import 'package:anidex/app/core/utils/service_configuration.dart';
import 'package:anidex/app/data/enums/service_enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class RestServices {
  static Future<http.Response> _request({
    required Uri uri,
    required Method method,
    String? body,
    String? token,
  }) async {
    debugPrint('Request URL: $uri');
    debugPrint('Request Body: $body');

    if (uri.toString().isEmpty) {
      throw ArgumentError('URI cannot be empty');
    }

    if (method == Method.post ||
        method == Method.put ||
        method == Method.delete) {
      if (body == null || body.isEmpty) {
        throw ArgumentError('Body cannot be empty for $method request');
      }
    }

    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      switch (method) {
        case Method.post:
          return await http.post(uri, headers: headers, body: body);
        case Method.put:
          return await http.put(uri, headers: headers, body: body);
        case Method.delete:
          return await http.delete(uri, headers: headers, body: body);
        case Method.patch:
          return http.patch(uri, headers: headers, body: body);
        case Method.get:
          return await http.get(uri, headers: headers);
      }
    } catch (e) {
      debugPrint('HTTP Request Error: ${e.toString()}');
      throw Exception('Failed to connect to the server');
    }
  }

  Future<String> getResponse({
    required String uri,
    required Method method,
    bool isTMDB = false,
    bool isAV = false,
    Map<String, dynamic>? queryParameters,
    String? body,
    String? token,
    bool handleTokenExpire = false,
  }) async {
    try {
      if (uri.isEmpty) {
        throw ArgumentError('URI cannot be empty');
      }

      final url = Uri.https(
        isTMDB
            ? ServiceConfiguration.moviesBaseUrl
            : isAV
            ? ServiceConfiguration.avBaseURL
            : ServiceConfiguration.baseUrl,
        uri,
        queryParameters,
      );
      debugPrint('Full URL: ${url.toString()}');

      final response = await _request(
        uri: url,
        method: method,
        body: body,
        token: token,
      ).timeout(const Duration(seconds: 180));

      debugPrint('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return response.body;
      } else if (handleTokenExpire &&
          (response.statusCode == 401 || response.statusCode == 400)) {
        debugPrint('Token Expired');
        return '';
      } else {
        debugPrint(
          'Unexpected Error: ${response.statusCode} - ${response.body}',
        );
        return '';
      }
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
      return "";
    }
  }
}
