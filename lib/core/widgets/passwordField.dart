import 'package:flutter/material.dart';

 import 'cutom_text_field.dart';
class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved; // إضافة هذا السطر للتعامل مع onSaved

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isObscure: obscureText,
      onSaved: widget.onSaved, // استخدام widget.onSaved هنا
      hintText: "كلمة المرور",
      textInputType: TextInputType.visiblePassword,
      icon: GestureDetector(
        child: Icon(
          obscureText ? Icons.remove_red_eye : Icons.visibility_off,
          color: const Color(0xffC9CECF),
        ),
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
