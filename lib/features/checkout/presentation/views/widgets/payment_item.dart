import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_decoration.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${title}",
          style: TextStyles.bold13,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8)
        ,decoration: AppDecorations.greyBoxDecoration, child: child)
      ],
    );
  }
}
