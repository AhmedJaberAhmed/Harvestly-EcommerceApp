import 'package:bloc/bloc.dart';
import 'package:ecommerece_fruites/core/repos/orders_repo/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/order entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo ;

  void addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order: order);

    result.fold(
          (failure) => emit(AddOrderFailure(failure.message)),
          (success) => emit(AddOrderSuccess()),
    );
  }

}
