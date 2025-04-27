import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(13.0),
            child: SvgPicture.asset("assets/images/search_icon.svg"),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(10.0), // Adjust padding for proper alignment
            child: SvgPicture.asset("assets/images/filter.svg"),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: Color(0xFF949D9E),
          ),
          hintText: "ابحث عن .....",
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
