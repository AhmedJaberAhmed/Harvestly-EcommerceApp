import 'package:ecommerece_fruites/core/helper_functions/get_user.dart';
import 'package:ecommerece_fruites/core/repos/orders_repo/orders_repo.dart';
import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:ecommerece_fruites/core/widgets/custom_appbar.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:ecommerece_fruites/features/checkout/presentation/manager/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:ecommerece_fruites/features/checkout/presentation/views/widgets/CheckoutViewBody.dart';
import 'package:ecommerece_fruites/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../home/domain/entities/cartEntity.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = "CheckoutView";
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity _orderEntity;

  @override
  void initState() {
    super.initState();
    // Initialize the OrderEntity with cartEntity and a new ShippingAddressEntity
    _orderEntity = OrderInputEntity(widget.cartEntity,
        uID: getUser().uId, shippingAddressEntity: ShippingAddressEntity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: "الشحن",
        ),
        body: Provider<OrderInputEntity>.value(
          value: _orderEntity, // Pass the initialized OrderEntity
          child: AddOrderCubitBlocBuilder(
            child: CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}
