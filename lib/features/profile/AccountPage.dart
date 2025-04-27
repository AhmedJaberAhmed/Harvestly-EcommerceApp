import 'package:ecommerece_fruites/core/helper_functions/get_user.dart';
import 'package:ecommerece_fruites/features/favourites/presentation/views/favourites_view.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/cart_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_text_styles.dart';
import '../../core/widgets/page _display_terms_and_condtions.dart';
import '../home/presentation/views/widgets/ProfileScreen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    bool notificationsEnabled = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'حسابي',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/profile_image.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  getUser().name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  getUser().email,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text("عام", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.green),
            title: const Text('الملف الشخصي'),
            trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.inventory_2_outlined, color: Colors.green),
            title: const Text('طلباتي'),
            trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
            onTap: () {
              Navigator.pushNamed(context, CartView.routeName);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.payment_outlined, color: Colors.green),
          //   title: const Text('المدفوعات'),
          //   trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.favorite_border, color: Colors.green),
            title: const Text('المفضلة'),
            trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
            onTap: () {
              Navigator.pushNamed(context, FavouritesView.routeName);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.notifications_none, color: Colors.green),
          //   title: const Text('الإشعارات'),
          //   trailing: Switch(value: notificationsEnabled, onChanged: (val) {}),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.language, color: Colors.green),
          //   title: const Text('اللغة'),
          //   trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.edit_outlined, color: Colors.green),
          //   title: const Text('الوضع'),
          //   trailing: Switch(value: isDarkMode, onChanged: (val) {}),
          // ),
          const SizedBox(height: 20),
          const Text("المساعدة", style: TextStyle(fontWeight: FontWeight.bold)),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.green),
            title: const Text('من نحن'),
            trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TermsConditionsPage()),
              );
            },
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("تأكيد تسجيل الخروج"),
                    content: const Text("هل أنت متأكد أنك تريد تسجيل الخروج؟"),
                    actions: [
                      TextButton(
                          child: const Text("إلغاء"),
                          onPressed: () => Navigator.pop(context, false)),
                      TextButton(
                          child: const Text("نعم"),
                          onPressed: () => Navigator.pop(context, true)),
                    ],
                  ),
                );

                if (confirmed ?? false) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('SignInView', (route) => false);
                }
              },
              leading: const Icon(Icons.logout, color: Colors.green),
              title: const Text(
                'تسجيل الخروج',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
