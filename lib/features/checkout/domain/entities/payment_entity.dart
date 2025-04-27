import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';

import 'Amount.dart';
import 'itemList.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: 'Payment description',
      itemList: ItemList.fromEntity(items: entity.cartEntity.cartItems),

    );
  }
  toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };



}
