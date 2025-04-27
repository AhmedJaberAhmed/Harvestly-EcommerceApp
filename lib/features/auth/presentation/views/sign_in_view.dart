import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:ecommerece_fruites/features/auth/domain/repos/auth.dart';
import 'package:ecommerece_fruites/features/auth/presentation/views/widgets/SignInViewBodyBlocConsumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../cubits/signIn_cubit/sign_in_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = "loginView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل الدخول"),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
