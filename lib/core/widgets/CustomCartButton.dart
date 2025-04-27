import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_item/cart_item_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../utils/custom_colors.dart';
import 'custom_button.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.info(
                    message: "لا توجد عناصر",
                    backgroundColor: AppColors.primaryColor,
                  ),
                );
              }
            },
            text:
                " الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنية ");
      },
    );
  }
}
