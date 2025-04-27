import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  num increaseQuantity() {
    return quantity++;
  }

  int decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
    return quantity;
  }


  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}

