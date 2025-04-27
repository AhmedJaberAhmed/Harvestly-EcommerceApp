import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/custom_colors.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primaryColor
              : AppColors.lightPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: isUser
              ? TextStyles.regular16.copyWith(color: Colors.white)
              : TextStyles.regular16.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}
