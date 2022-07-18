import 'dart:convert';

import 'package:news_test_app/api/provider_response.dart';
import 'package:http/http.dart' as http;

abstract class Provider {
  Future<ProviderResponse> get(String url,) async {
    final response = await http.get(Uri.parse(url));
    final decoded = jsonDecode(utf8.decode(response.bodyBytes));

    if(response.statusCode >= 200 && response.statusCode < 300) {
      return ProviderResponse(
        content: decoded,
        success: true,
      );
    }
    return const ProviderResponse(
      success: false,
    );
  }
}