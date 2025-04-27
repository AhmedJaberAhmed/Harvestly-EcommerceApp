import 'package:dartz/dartz.dart';

import '../../../features/checkout/domain/entities/order entity.dart';
import '../../errors/failure.dart';

abstract class OrdersRepo {

  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});


}