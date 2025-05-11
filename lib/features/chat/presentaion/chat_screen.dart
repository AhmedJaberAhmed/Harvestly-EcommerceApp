import 'package:ecommerece_fruites/features/chat/presentaion/widgets/message_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/custom_colors.dart';
import '../manager/chat_controller.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: Colors.white), // this makes the arrow white
          title: Text(
            'AI Fruit Chat',
            style: TextStyles.bold19.copyWith(color: Colors.white),
          ),
        ),

        body: Consumer<ChatController>(
          builder: (context, chatController, _) => Column(
            children: [
              Expanded(child: MessageList(messages: chatController.messages)),
              _buildInputArea(chatController, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea(ChatController chatController, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController.controller,
              decoration: InputDecoration(
                hintText: "Type about fruits...",
                hintStyle: TextStyles.regular13,
                contentPadding: const EdgeInsets.all(12),
                border: const OutlineInputBorder(),
              ),
              style: TextStyles.regular16,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: AppColors.primaryColor),
            onPressed: () => chatController.sendMessage(context),
          ),
        ],
      ),
    );
  }
}
