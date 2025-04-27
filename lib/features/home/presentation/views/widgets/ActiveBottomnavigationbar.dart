import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerPadding = screenWidth * 0.04;
    double iconSize = screenWidth * 0.06;
    double textSize = screenWidth * 0.035;

    return FittedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: containerPadding, vertical: containerPadding * 0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFFEEEEEE), Color(0xFFDADADA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: iconSize * 1.5,
              height: iconSize * 1.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E37), Color(0xFF3A7D57)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              text,
              style: TextStyles.semiBold11.copyWith(
                color: AppColors.primaryColor,
                fontSize: textSize,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
