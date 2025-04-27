import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/product_Entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/repos/products_repo/products_repo.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final ProductsRepo productsRepo;
  List<ProductEntity> _favouritedProducts = []; // Internal list to keep track of favourited products.

  FavouritesCubit(this.productsRepo) : super(FavouritesInitial());

  // Add product to favorites
  Future<Either<Failure, List<ProductEntity>>> addFavouritesToFireBse(ProductEntity product) async {
    emit(FavouritesLoading()); // Emit loading state while processing.

    var result = await productsRepo.addFavouritesToFireBase(product);

    result.fold(
          (l) {
        emit(FavouritesFailure(l.message)); // Emit failure if there's an error.
      },
          (r) {
        _favouritedProducts = r; // Update internal favourites list.
        emit(FavouritesSuccess(favourites: r)); // Emit updated favourites list.
      },
    );

    return result;
  }

  // Remove product from favorites
  Future<Either<Failure, List<ProductEntity>>> removeFromFavourites(ProductEntity product) async {
    emit(FavouritesLoading()); // Emit loading state while processing.

    var result = await productsRepo.removeFromFavourites(product.code);

    result.fold(
          (l) {
        emit(FavouritesFailure(l.message)); // Emit failure if there's an error.
      },
          (r) {
        _favouritedProducts = r; // Update internal favourites list.
        emit(FavouritesSuccess(favourites: r)); // Emit updated favourites list.
      },
    );

    return result;
  }

  // Check if product is in favourites
  bool isProductFavourited(ProductEntity product) {
    return _favouritedProducts.any((p) => p.code == product.code);
  }

  // Get all favourites from Firestore
  Future<Either<Failure, List<ProductEntity>>> getFavouritesToFireBse() async {
    emit(FavouritesLoading()); // Emit loading state while fetching.

    var result = await productsRepo.getFavouritesFromFireBase();

    result.fold(
          (l) {
        emit(FavouritesFailure(l.message)); // Emit failure if there's an error.
      },
          (r) {
        _favouritedProducts = r; // Update internal favourites list.
        emit(FavouritesSuccess(favourites: r)); // Emit favourites list.
      },
    );

    return result;
  }
}
