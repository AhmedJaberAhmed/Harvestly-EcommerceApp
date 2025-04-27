part of 'add_order_cubit.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}
final class AddOrderLoading extends AddOrderState {}
final class AddOrderFailure extends AddOrderState {
  final String errMessage;

  AddOrderFailure( this.errMessage);

}
final class AddOrderSuccess extends AddOrderState {}
