import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:ecommerece_fruites/core/utils/custom_colors.dart';

import '../../cubits/signup_cubit/signup_cubit.dart';
import 'SignUpViewBody.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "تم التسجيل بنجاح!",
              backgroundColor: AppColors.primaryColor,
            ),
          );
          Navigator.pop(context);

        }

        if (state is SignupFailure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
