import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_item/cart_item_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/widgets/CustomNetworkImage.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },

      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCartItem(cartItemEntity);
                          },
                          child: SvgPicture.asset(
                            "assets/images/trash.svg",
                          ),
                        )
                      ],
                    ),
                    Text(
                      '  ${cartItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            CartItemActionButtons(
                              cartItemEntity: cartItemEntity,
                            )
                          ],
                        )
                        // Placeholder for CartItemActionButtons (if any action buttons exist)
                        ,
                        Spacer(),
                        Text(
                          ' ${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
