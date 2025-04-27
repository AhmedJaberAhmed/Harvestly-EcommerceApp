import 'package:bloc/bloc.dart';
import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/features/home/domain/entities/cartEntity.dart';
import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItemEntity(productEntity);

    if (isProductExist) {
      cartItem.quantity++;
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartItemAdded(cartItems: List.from(cartEntity.cartItems)));
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved(cartItems: List.from(cartEntity.cartItems)));
  }
}
