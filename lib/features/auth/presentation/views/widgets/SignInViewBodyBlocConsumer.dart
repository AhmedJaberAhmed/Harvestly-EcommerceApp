
import 'package:ecommerece_fruites/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../home/presentation/views/main_view.dart';
import '../../cubits/signIn_cubit/sign_in_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "تم التسجيل بنجاح!",
              backgroundColor: AppColors.primaryColor,
            ),
          );
          Navigator.pushNamed(context, MainView.routeName);
         }

        if (state is SignInFailure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.message,
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state)
      {
        return ModalProgressHUD(
        inAsyncCall: state is SignInLoading? true:false
        ,child: SignInViewBody());
      },
    );
  }
}
