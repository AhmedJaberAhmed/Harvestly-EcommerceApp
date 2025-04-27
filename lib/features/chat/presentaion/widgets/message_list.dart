import 'package:flutter/material.dart';
import 'message_bubble.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, String>> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          message: message['content'] ?? '',
          isUser: message['role'] == 'user',
        );
      },
    );
  }
}
