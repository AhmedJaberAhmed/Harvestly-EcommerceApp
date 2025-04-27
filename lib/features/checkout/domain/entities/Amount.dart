import '../../../../core/helper_functions/getCurrency.dart';
import 'details.dart';
import 'order entity.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});


  factory Amount.fromEntity(OrderInputEntity entity) {
    return Amount(
      total: entity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    ); // Amount
  }
toJson()=>{
  "total":total,
  "currency":currency,
  "details":details!.toJson(),
};


}




// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['total'] = this.total;
//   data['currency'] = this.currency;
//   if (this.details != null) {
//     data['details'] = this.details!.toJson();
//   }
//   return data;
// }


