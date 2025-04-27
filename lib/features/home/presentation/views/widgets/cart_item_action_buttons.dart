import 'package:ecommerece_fruites/core/utils/app_text_styles.dart';
import 'package:ecommerece_fruites/core/utils/custom_colors.dart';
import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_item/cart_item_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          iconColor: Colors.white, // corrected variable name to iconColor
          icon: Icons.add,
          onPressed: () {
            cartItemEntity.increaseQuantity();
           context.read<CartItemCubit>().updateCartItem(cartItemEntity);

          },
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            cartItemEntity.quantity.toString(),
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          iconColor: Colors.grey, // corrected variable name to iconColor
          icon: Icons.remove,
          onPressed: () {
            cartItemEntity.decreaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          color: const Color(0xFFF3F5F7),
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.iconColor, // corrected variable name to iconColor
  });

  final Color iconColor; // corrected variable name to iconColor
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // padding for better icon positioning
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor, // corrected variable name to iconColor
          ),
        ),
      ),
    );
  }
}
