import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';

class  CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
  double calculateTotalPrice(){
    double totalPrice=0;
    for(var cartItem in cartItems){
      totalPrice+=cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  removeCartItem(CartItemEntity  cartItem){
    cartItems.remove(cartItem);
  }


  CartItemEntity getCartItemEntity (ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product,quantity: 1);
  }

  void decCartItem(CartItemEntity cartItemEntity) {
    for (var item in cartItems) {
      if (item.productEntity == cartItemEntity.productEntity) {
        if (item.quantity > 1) {
          item.quantity--;
        } else {
          cartItems.remove(item);
        }
        break;
      }
    }
  }


}