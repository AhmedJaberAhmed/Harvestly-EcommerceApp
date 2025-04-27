
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../features/auth/presentation/views/signup_view.dart';
import '../utils/app_text_styles.dart';
import '../utils/custom_colors.dart';

class DonotHavaAnAccountWidget extends StatelessWidget {
  const DonotHavaAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(

              text: 'لا تمتلك حساب ؟',
              style: TextStyles.semiBold16.copyWith(
                color: Color(0xFF949D9E),

              )          ),
          TextSpan(
              text: '',

              // Empty string, consider removing if not needed
              style: TextStyles.semiBold16.copyWith(
                color: Color(0xFF616A6B),
              )
          ),
          TextSpan(

              recognizer: TapGestureRecognizer()..onTap=(){
                Navigator.pushNamed(context,SignupView.routeName);

              },
              text: ' قم بانشاء حساب',

              style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor)
          ), // Removed extra '?'
        ], // Added closing bracket for children
      ), // Added closing bracket for TextSpan
    );
  }
}
