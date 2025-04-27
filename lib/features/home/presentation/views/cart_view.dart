import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_item/cart_item_cubit.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/widgets/CartViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
static const routeName='cartView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>CartItemCubit(),

        child: Scaffold(body: const CartViewbody()));

  }
}
