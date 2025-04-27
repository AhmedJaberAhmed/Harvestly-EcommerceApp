
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:ecommerece_fruites/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: "ملخص الطلب",
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  " المجموع الفرعي  : ",
                  style: TextStyles.regular13
                      .copyWith(color: Color(0xFF4E5556)),
                ),
                Spacer(),
                Text(
                "${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()}جنية ",
                  textAlign: TextAlign.right,
                  style: TextStyles.semiBold16,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  " التوصيل  :",
                  style: TextStyles.regular13
                      .copyWith(color: Color(0xFF4E5556)),
                ),
                Spacer(),
                Text('30 جنيه',
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: Color(0xFF4E5556),
                    ))
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Divider(
              thickness: 0.5,
              color: Color(0xFFCACECE),
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Text(
                  "الكلي",
                  style: TextStyles.bold16,
                ),
                Spacer(),
                Text("${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()+30}جنية  ",
                    textAlign: TextAlign.right,
                    style: TextStyles.bold16)
              ],
            )
          ],
        ));
  }
}
