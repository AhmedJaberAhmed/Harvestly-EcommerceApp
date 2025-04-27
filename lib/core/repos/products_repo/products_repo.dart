
import 'package:dartz/dartz.dart';

import '../../entities/product_Entity.dart';
import '../../errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> addFavouritesToFireBase(ProductEntity product);
  Future<Either<Failure, List<ProductEntity>>> getFavouritesFromFireBase( );
  Future<Either<Failure, List<ProductEntity>>> removeFromFavourites(String productCode);  // Add this line

}