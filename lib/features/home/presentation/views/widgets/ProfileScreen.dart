
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:   AppBar(
        title: Text(
        'الملف الشخصي',
        style: TextStyles.bold19.copyWith(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF4CAF50),
      iconTheme: const IconThemeData(color: Colors.white),
    ),

    body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profile_image.png'), // Replace with actual image
                  ),
                ),
                SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الاسم : ${getUser().name}", style: TextStyles.bold16),
                      SizedBox(height: 10),
                      Text("الحساب : ${getUser().email}", style: TextStyles.bold16),
                      SizedBox(height: 10),
                      Text("معرّف المستخدم : ${getUser().uId}", style: TextStyles.bold16),
                    ],
                  ),
                )

                // Add more fields if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
