// class Transaction {
//   final Amount amount;
//   final String description;
//   final ItemList itemList;
//
//   const Transaction({
//     required this.amount,
//     required this.description,
//     required this.itemList,
//   });
//
//   factory Transaction.fromJson(Map<String, dynamic> json) {
//     return Transaction(
//       amount: Amount.fromJson(json['amount']),
//       description: json['description'],
//       itemList: ItemList.fromJson(json['item_list']),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'amount': amount.toJson(),
//     'description': description,
//     'item_list': itemList.toJson(),
//   };
// }
//
// class Amount {
//   final String total;
//   final String currency;
//   final AmountDetails details;
//
//   const Amount({
//     required this.total,
//     required this.currency,
//     required this.details,
//   });
//
//   factory Amount.fromJson(Map<String, dynamic> json) {
//     return Amount(
//       total: json['total'],
//       currency: json['currency'],
//       details: AmountDetails.fromJson(json['details']),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'total': total,
//     'currency': currency,
//     'details': details.toJson(),
//   };
// }
//
// class AmountDetails {
//   final String subtotal;
//   final String shipping;
//   final int shippingDiscount;
//
//   const AmountDetails({
//     required this.subtotal,
//     required this.shipping,
//     required this.shippingDiscount,
//   });
//
//   factory AmountDetails.fromJson(Map<String, dynamic> json) {
//     return AmountDetails(
//       subtotal: json['subtotal'],
//       shipping: json['shipping'],
//       shippingDiscount: json['shipping_discount'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'subtotal': subtotal,
//     'shipping': shipping,
//     'shipping_discount': shippingDiscount,
//   };
// }
//
// class ItemList {
//   final List<Item> items;
//
//   const ItemList({required this.items});
//
//   factory ItemList.fromJson(Map<String, dynamic> json) {
//     var itemsJson = json['items'] as List;
//     List<Item> itemList = itemsJson.map((e) => Item.fromJson(e)).toList();
//
//     return ItemList(items: itemList);
//   }
//
//   Map<String, dynamic> toJson() => {
//     'items': items.map((e) => e.toJson()).toList(),
//   };
// }
//
// class Item {
//   final String name;
//   final int quantity;
//   final String price;
//   final String currency;
//
//   const Item({
//     required this.name,
//     required this.quantity,
//     required this.price,
//     required this.currency,
//   });
//
//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       name: json['name'],
//       quantity: json['quantity'],
//       price: json['price'],
//       currency: json['currency'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'name': name,
//     'quantity': quantity,
//     'price': price,
//     'currency': currency,
//   };
// }
