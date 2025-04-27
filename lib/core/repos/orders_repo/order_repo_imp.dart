import 'package:dartz/dartz.dart';
import 'package:ecommerece_fruites/core/errors/failure.dart';
import 'package:ecommerece_fruites/core/repos/orders_repo/orders_repo.dart';
import 'package:ecommerece_fruites/core/services/DatabaseService.dart';
import 'package:ecommerece_fruites/core/utils/backend_endpoints.dart';
import 'package:ecommerece_fruites/features/checkout/data/models/order_model.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';

class OrderRepoImp implements OrdersRepo {
  final DatabaseService fireStoreService;

  OrderRepoImp(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order}) async {
    try {
      var orderModel=OrderModel.fromEntity(order);
      await fireStoreService.addData(
          documentId:orderModel.orderId ,
          path: BackendEndPoints.addOrder,
          data:orderModel.toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
