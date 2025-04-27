import 'package:flutter/material.dart';
import '../../../core/helper_functions/fruit_keyword.dart';
import '../services/chat_service.dart';

class ChatController extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  Future<void> sendMessage(BuildContext context) async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    if (!_isFruitRelated(text)) {
      _showError(context, "Please talk only about fruits!");
      return;
    }

    messages.add({"role": "user", "content": text});
    controller.clear();
    notifyListeners();

    final aiMessage = await ChatService.sendMessage(messages);
    if (aiMessage != null) {
      messages.add({"role": "assistant", "content": aiMessage});
      notifyListeners();
    }
  }

  bool _isFruitRelated(String message) {
    final lowerMessage = message.toLowerCase();
    return fruitKeywords.any((fruit) => lowerMessage.contains(fruit));
  }

  void _showError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}
