import 'package:ecommerece_fruites/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;

  String? address;
  String? city;
  String? phone;
  String? floor;

  ShippingAddressModel(
      {this.name, this.email, this.address, this.floor, this.city, this.phone});

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      floor: entity.floor,
      city: entity.city,
      email: entity.email,
    );
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'floor': floor,
      'city': city,
      'email': email,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$address $floor $city';
  }
}
