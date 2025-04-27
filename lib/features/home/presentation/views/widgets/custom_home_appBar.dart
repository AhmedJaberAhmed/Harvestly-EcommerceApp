import 'package:ecommerece_fruites/core/helper_functions/get_user.dart';
import 'package:ecommerece_fruites/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/Notification_widget.dart';
import '../../../../chat/presentaion/chat_screen.dart';
class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: AppColors.lightPrimaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()), // تأكد أن عندك ChatPage
              );
            },
          ),
          SizedBox(width: 8),
          Favourites_widget(),
        ],
      ),
      leading: Image.asset("assets/images/profile_image.png"),
      title: Text(
        "صباح الخير!..",
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),
    );
  }
}
