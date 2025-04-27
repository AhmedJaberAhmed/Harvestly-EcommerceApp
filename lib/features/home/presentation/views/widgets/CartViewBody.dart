import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/CustomDivider.dart';
import '../../../../../core/widgets/CustomCartButton.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'cart_header.dart';
import 'cart_items_list.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CartViewbody extends StatelessWidget {
  const CartViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Ensure proper alignment
                  children: [
                    Expanded(
                      child: buildAppBar(
                        context,
                        title: "السلة",
                      ),
                    ),
                    //       Notification_widget(),
                    // Ensure this widget is properly implemented
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CartHeader(),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                ? SizedBox()
                : CustomDivider(),
          ),
          CartItemsList(
            cartItems: context.watch<CartCubit>().cartEntity.cartItems,
          ),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                ? SizedBox()
                : CustomDivider(),
          ),
        ],
      ),
      Positioned(
          left: 15,
          right: 15,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: CustomCartButton()),
    ]);
  }
}
