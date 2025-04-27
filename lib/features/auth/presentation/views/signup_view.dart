import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:ecommerece_fruites/features/auth/domain/repos/auth.dart';
import 'package:ecommerece_fruites/features/auth/presentation/views/widgets/SignUpViewBodyBlocConsumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = "routeName";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SignUpViewBodyBlocConsumer(),
        appBar: buildAppBar(
          context,
          title: "انشاء حساب جديد",
        ),
      ),
    );
  }
}
