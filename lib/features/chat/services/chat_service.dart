import 'package:dio/dio.dart';

class ChatService {
  static const String _apiKey = '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';
  static const String _endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _endpoint,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
        'HTTP-Referer': 'https://yourapp.com',
        'X-Title': 'MyTestApp',
      },
    ),
  );

  static Future<String?> sendMessage(List<Map<String, String>> messages) async {
    try {
      final response = await _dio.post(
        '',
        data: {
          "model": "openai/gpt-3.5-turbo",
          "messages": messages,
        },
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
//ahmedaaasasas