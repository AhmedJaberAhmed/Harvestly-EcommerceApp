import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.index, required this.text});

  final String index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFF2F3F3),
            child: Text(
             index,
              style: TextStyles.semiBold13,
            )),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: Color(0xFFAAAAAA)),
        )
      ],
    );
  }
}
