import 'package:ecommerece_fruites/core/services/DatabaseService.dart';
import 'package:ecommerece_fruites/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/repos/auth.dart';
import '../repos/orders_repo/order_repo_imp.dart';
import '../repos/orders_repo/orders_repo.dart';
import '../repos/products_repo/products_repo.dart';
import '../repos/products_repo/products_repo_imp.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {


  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      databaseService: getIt<DatabaseService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImp(
      getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrderRepoImp(
      getIt<DatabaseService>(),
    ),
  );







}
