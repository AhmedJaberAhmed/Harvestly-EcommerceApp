import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/CustomDivider.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => CustomDivider(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CartItem(
            cartItemEntity: cartItems[index],
          ),
        );
      },
      itemCount: cartItems.length,
    );
  }
}
