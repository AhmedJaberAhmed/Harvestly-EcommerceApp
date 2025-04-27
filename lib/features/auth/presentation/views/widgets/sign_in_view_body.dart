import 'dart:io';

import 'package:ecommerece_fruites/core/utils/app_text_styles.dart';
import 'package:ecommerece_fruites/core/widgets/custom_button.dart';
import 'package:ecommerece_fruites/core/widgets/cutom_text_field.dart';
import 'package:ecommerece_fruites/core/widgets/or_divider.dart';
import 'package:ecommerece_fruites/core/widgets/passwordField.dart';
import 'package:ecommerece_fruites/features/auth/presentation/cubits/signIn_cubit/sign_in_cubit.dart';
import 'package:ecommerece_fruites/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/widgets/DonotHavaAnAccountWidget.dart';
import '../../../../auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(

                onSaved: (value) {
                  email = value!.trim();
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!.trim();
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(children: [
                Text("نسيت كلمة المرور ؟",
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor)),
              ]),
              SizedBox(
                height: 33,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      context.read<SignInCubit>().signInWithEmailAndPassword(email, password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: "تسجيل الدخول"),
              SizedBox(
                height: 33,
              ),
              const DonotHavaAnAccountWidget(),
              SizedBox(
                height: 33,
              ),
              OrDivider(),
              SizedBox(
                height: 20,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SignInCubit>().signinWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: "تسجيل بواسطة جوجل",
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
                image: Assets.imagesFacbookIcon,
                title: "تسجيل بواسطة Facebook",
              ),
              SizedBox(
                height: 16,
              ),
              Platform.isIOS ? SocialLoginButton(
                onPressed: () {
                  context.read<SignInCubit>().signInWithApple();
                },
                image: Assets.imagesAppleIcons,
                title: "تسجيل بواسطة Apple",
              ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
