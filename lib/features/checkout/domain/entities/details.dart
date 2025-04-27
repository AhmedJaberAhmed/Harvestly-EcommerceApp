
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['shipping'] = this.shipping;
    data['shipping_discount'] = this.shippingDiscount;
    return data;
  }



    factory DetailsEntity.fromEntity(OrderInputEntity  entity)=>DetailsEntity(
      subtotal: entity.cartEntity.calculateTotalPrice().toString(),
      shipping: entity.calculateShippingCost().toString(),
      shippingDiscount: entity.calcualteShippingDiscount(),


    );


}


