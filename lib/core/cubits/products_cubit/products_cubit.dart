import 'package:bloc/bloc.dart';
import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  // Fetch all products
  int productLenght = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading()); // Emitting loading state
    var result = await productsRepo.getProducts(); // Fetch products from repo

    // Handling failure or success
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      // If failure, emit failure state
      (products) =>
          emit(ProductsSuccess(products)), // If success, emit success state
    );
  }

  // Fetch best-selling products
  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading()); // Emitting loading state
    var result = await productsRepo
        .getBestSellingProducts(); // Fetch best-sellers from repo

    // Handling failure or success
    result.fold((failure) => emit(ProductsFailure(failure.message)),
        // If failure, emit failure state
        (products) {
      productLenght = products.length;
      emit(ProductsSuccess(products));
    } // If success, emit success state
        );
  }
}
