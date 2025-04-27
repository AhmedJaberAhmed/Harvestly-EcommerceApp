import 'package:flutter/cupertino.dart';

class Custromerrorwidget extends StatelessWidget {
  const Custromerrorwidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Text(text),
    );
  }
}
