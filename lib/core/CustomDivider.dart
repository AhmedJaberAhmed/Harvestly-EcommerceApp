
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 22,
      color: Color(0xFFF1F1F5),
      thickness: 1,
    );
  }
}
