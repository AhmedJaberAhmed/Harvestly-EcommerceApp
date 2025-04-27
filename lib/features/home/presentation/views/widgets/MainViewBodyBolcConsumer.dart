import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/utils/custom_colors.dart';
import 'MainViewBody.dart';

class MainViewBodyBolcConsumer extends StatelessWidget {
  const MainViewBodyBolcConsumer({
    super.key,
    required this.selectedIndex,
    required List<Widget> pages,
  }) : _pages = pages;

  final int selectedIndex;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "تمت إضافة المنتج بنجاح",
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }   if (state is CartItemRemoved ) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "تمت إزالة المنتج بنجاح",
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      child: MainViewBody(selectedIndex: selectedIndex, pages: _pages),
    );
  }
}
