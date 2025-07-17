
import 'package:dartz/dartz.dart';

import '../../../features/categories/category_model.dart';
import '../../entities/product_Entity.dart';
import '../../errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String categoryCode);
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> addFavouritesToFireBase(ProductEntity product);
  Future<Either<Failure, List<ProductEntity>>> searchProductsByName(String name);

  Future<Either<Failure, List<ProductEntity>>> getFavouritesFromFireBase( );
  Future<Either<Failure, List<ProductEntity>>> removeFromFavourites(String productCode);  // Add this line

}