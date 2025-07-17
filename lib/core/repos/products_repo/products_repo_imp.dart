import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/core/errors/failure.dart';
import 'package:ecommerece_fruites/core/models/product_model.dart';
import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:ecommerece_fruites/core/services/DatabaseService.dart';
import 'package:ecommerece_fruites/core/utils/backend_endpoints.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/categories/category_model.dart';


class ProductsRepoImp extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImp(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
        path: BackendEndPoints.getProducts,
      ) as List<Map<String, dynamic>>;

      print("Raw Firebase Response: $data"); // Print raw response to debug

      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return left(ServerFailure("Failed to get best-selling products"));
    }
  }


  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndPoints.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure("Failed to get product"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> addFavouritesToFireBase(
      ProductEntity product) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null)
        return Left(ServerFailure("المستخدم غير مسجل الدخول."));

      final documentId = '${userId}_${product.code}';

      // Check if already added
      final existingDoc = await databaseService.getData(
        path: BackendEndPoints.favourites,
        documentId: documentId,
      );

      if (existingDoc != null) {
        return Left(ServerFailure("المنتج موجود بالفعل في المفضلة."));
      }

      final model = ProductModel.fromEntity(product);
      final data = model.toJson()
        ..addAll({
          'userId': userId,
        });

      await databaseService.addData(
        path: BackendEndPoints.favourites,
        documentId: documentId,
        data: data,
      );

      return Right([product]);
    } catch (e, stackTrace) {
      log(
        "Error in addFavouritesToFireBase: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure("فشل في حفظ المنتج في المفضلة."));
    }
  }

  @override
  Future<
      Either<Failure, List<ProductEntity>>> getFavouritesFromFireBase() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        return Left(ServerFailure("المستخدم غير مسجل الدخول."));
      }


      var rawData = await databaseService.getData(
          path: BackendEndPoints.favourites);


      final List<Map<String, dynamic>> dataList = (rawData as List)
          .whereType<Map<String, dynamic>>()
          .where((e) => e['userId'] == userId)
          .toList();


      List<ProductEntity> products = dataList
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return Right(products);
    } catch (e, stackTrace) {
      log(
        "Error in getFavouritesToFireBase: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure("فشل في تحميل المنتجات المفضلة."));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> removeFromFavourites(
      String productCode) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null)
        return Left(ServerFailure("المستخدم غير مسجل الدخول."));

      final documentId = '${userId}_$productCode'; // Unique ID per user-product

      // Check if the document exists in the 'favourites' collection
      final existingDoc = await databaseService.getData(
        path: BackendEndPoints.favourites,
        documentId: documentId,
      );

      if (existingDoc == null) {
        return Left(ServerFailure("المنتج غير موجود في المفضلة."));
      }


      await databaseService.deleteData(
        path: BackendEndPoints.favourites,
        documentId: documentId,
      );


      var updatedFavourites = await getFavouritesFromFireBase();

      return updatedFavourites;
    } catch (e, stackTrace) {
      log(
        "Error in removeFromFavourites: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure("فشل في إزالة المنتج من المفضلة."));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndPoints.getCategories) as List<Map<String, dynamic>>;

      print("Fetched Categories Data: $data"); // Debugging output

      // Assuming CategoryModel.fromJson() converts the data into a CategoryEntity object
      List<CategoryEntity> categories = data
          .map((e) => CategoryModel.fromJson(e).toEntity())
          .toList();

      return right(categories);
    } catch (e) {
      return left(ServerFailure("Failed to get categories"));
    }
  }


  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String categoryCode) async {
    try {
      print("Fetching products for categoryCode: $categoryCode"); // Debug log
      var data = await databaseService.getData(
        path: BackendEndPoints.getProducts,
        query: {
          'filterBy': 'categoryCode',
          'isEqualTo': categoryCode,
        },
      ) as List<Map<String, dynamic>>;

      print("Fetched products: $data"); // Debug log
      List<ProductEntity> products = data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      print("Mapped products: ${products.length} items"); // Debug log
      return Right(products);
    } catch (e, stackTrace) {
      log('Error in getProductsByCategory: $e', stackTrace: stackTrace);
      return Left(ServerFailure("فشل في تحميل المنتجات حسب التصنيف."));
    }
  }
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProductsByName(String name) async {
    try {
      final query = {
        'filterBy': 'name',
        'isGreaterThanOrEqualTo': name,
        'isLessThanOrEqualTo': name + '\uf8ff',
      };

      final data = await databaseService.getData(
        path: BackendEndPoints.getProducts,
        query: query,
      ) as List<Map<String, dynamic>>;

      final products = data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e, stackTrace) {
      log("Error in searchProductsByName: $e", error: e, stackTrace: stackTrace);
      return left(ServerFailure("فشل في البحث عن المنتجات."));
    }
  }

}