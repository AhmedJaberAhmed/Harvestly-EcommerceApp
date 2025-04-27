import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_colors.dart';


class  HaveAnAccountWidget extends StatelessWidget {
  const  HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(

              text: ' تمتلك حساب بالفعل ؟',
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
                Navigator.of(context).pop();

              },
              text: ' تسجيل دخول',

              style: TextStyles.semiBold16.copyWith(color: AppColors.lightPrimaryColor  )
          ), // Removed extra '?'
        ], // Added closing bracket for children
      ), // Added closing bracket for TextSpan
    );
  }
}
