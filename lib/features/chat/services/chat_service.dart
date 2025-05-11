import 'dart:convert';
import 'package:dio/dio.dart';

class ChatService {
  static const String _apiKey = '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';
  static const String _endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  static Future<String?> sendMessage(List<Map<String, String>> messages) async {
    try {
      Dio dio = Dio();

      // Set up headers
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
        'HTTP-Referer': 'https://yourapp.com',
        'X-Title': 'MyTestApp',
      };

      // Prepare the request body
      final body = {
        "model": "openai/gpt-3.5-turbo",
        "messages": messages,
      };

      // Send the request using Dio
      final response = await dio.post(
        _endpoint,
        data: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        return data['choices'][0]['message']['content'];
      } else {
        print('Failed to connect: ${response.data}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
