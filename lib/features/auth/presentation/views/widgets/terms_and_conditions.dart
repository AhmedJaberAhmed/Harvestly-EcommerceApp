import 'package:ecommerece_fruites/core/utils/custom_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/page _display_terms_and_condtions.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.3,
          child: CustomCheckBox(
            isChecked: isTermsAccepted,
            onChecked: (value) {
              setState(() {
                widget.onChanged(value);
                isTermsAccepted = value;
              });
            },
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'من خلال إنشاء حساب, فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                    fontSize: screenWidth * 0.035,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to Terms & Conditions Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsConditionsPage(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
