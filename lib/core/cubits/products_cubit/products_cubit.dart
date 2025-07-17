import 'package:bloc/bloc.dart';
import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

import '../../../features/categories/category_model.dart';

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

  // In ProductsCubit
  Future<void> getCategories() async {
    emit(ProductsLoading());
    var result = await productsRepo.getCategories();

    result.fold(
          (failure) => emit(ProductsFailure(failure.message)),
          (categories) => emit(CategoriesSuccess(List<CategoryEntity>.from(categories))),
    );
  }

// In ProductsCubit
  Future<void> getProductsByCategory(String categoryCode) async { // Change parameter name for clarity
    emit(ProductsLoading());
    final result = await productsRepo.getProductsByCategory(categoryCode);
    result.fold(
          (failure) => emit(ProductsFailure(failure.message)),
          (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> searchProductsByName(String query) async {
    emit(ProductsLoading());

    final allProductsResult = await productsRepo.getProducts();
    allProductsResult.fold(
          (failure) => emit(ProductsFailure(failure.message)),
          (products) {
        final filtered = products
            .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(ProductsSuccess(filtered));
      },
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
