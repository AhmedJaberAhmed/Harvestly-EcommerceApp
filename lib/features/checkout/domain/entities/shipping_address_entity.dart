class ShippingAddressEntity {
  String? name;
  String? email;

  String? address;
  String? city;
  String? phone;
  String? floor;

  ShippingAddressEntity(
      {this.name, this.email, this.address, this.floor, this.city, this.phone});

  @override
  String toString() {
    // TODO: implement toString
    return '$address $floor $city';
  }
}
