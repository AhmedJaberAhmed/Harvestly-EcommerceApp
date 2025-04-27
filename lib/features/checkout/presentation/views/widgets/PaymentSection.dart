import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Delivery_adress.dart';
import 'OrderSummaryWidget.dart';


class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24,),
        OrderSummaryWidget(),SizedBox(height: 16,),
        DeliveryAdress(pageController: pageController,)
      ],
    );
  }
}
