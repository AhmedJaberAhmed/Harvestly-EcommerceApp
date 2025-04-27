part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  final List<CartItemEntity> cartItems;

  const CartState({required this.cartItems});
}

class CartInitial extends CartState {
  CartInitial() : super(cartItems: []);
}

class CartItemAdded extends CartState {
  CartItemAdded({required List<CartItemEntity> cartItems})
      : super(cartItems: cartItems);
}

class CartItemRemoved extends CartState {
  CartItemRemoved({required List<CartItemEntity> cartItems})
      : super(cartItems: cartItems);
}
