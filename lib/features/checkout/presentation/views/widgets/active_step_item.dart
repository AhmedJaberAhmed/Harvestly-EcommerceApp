import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_colors.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(size: 18,
            Icons.check,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
