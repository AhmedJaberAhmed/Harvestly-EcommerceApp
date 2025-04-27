import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ShippingItem.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderInputEntity>();
    return Column(
      children: [
        SizedBox(
          height: 33,
        ),

        ShippingItem(
          onTap: () {
            selectedIndex = 0;
            setState(() {});
            orderEntity.payWithCash=true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() +
                  30)
              .toString(),
        ), // ShippingItem

        SizedBox(
          height: 16,
        ), // SizedBox

        ShippingItem(
          onTap: () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash=false;
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجى تحديد طريقة الدفع',
          price: context
              .read<OrderInputEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        ), // ShippingItem
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true ;
}
