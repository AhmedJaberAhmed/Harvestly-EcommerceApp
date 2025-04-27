import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final String image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xFFDCDEDE), width: 1))),
        onPressed: onPressed,
        child: ListTile(visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity
        ),
          leading: SvgPicture.asset(image),
          title: Text(textAlign: TextAlign.center,
            title,
            style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
