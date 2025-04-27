import 'package:ecommerece_fruites/core/widgets/custom_button.dart';
import 'package:ecommerece_fruites/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/cutom_text_field.dart';
import '../../../../../core/widgets/passwordField.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'have_an_account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}
class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool istermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: "الاسم الكامل",
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!.trim();
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!.trim(); // حفظ القيمة المدخلة في المتغير password
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditions(
                onChanged: (value) {
                  istermsAccepted = value;
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (istermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                            email, password, userName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("يجب عليك الموافقة على الأحكام والشروط"),
                        ));
                      }
                    }
                  },
                  text: "انشاء حساب جديد"),
              SizedBox(height: 26),
              HaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
