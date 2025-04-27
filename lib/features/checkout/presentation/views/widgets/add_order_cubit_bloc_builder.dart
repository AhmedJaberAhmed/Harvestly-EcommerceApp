import 'package:ecommerece_fruites/features/checkout/presentation/manager/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/utils/custom_colors.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
 if(state is AddOrderSuccess){
   showTopSnackBar(
     Overlay.of(context),
     CustomSnackBar.success(
       message: "تمت العملية بنجاح !",
       backgroundColor: AppColors.primaryColor,
     ),
   );

 } if (state is AddOrderFailure){

   showTopSnackBar(
     Overlay.of(context),
     CustomSnackBar.error(
       message: state.errMessage,
       backgroundColor: AppColors.primaryColor,
     ),
   );


 }


        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is AddOrderLoading, child: child);
        });
  }
}
