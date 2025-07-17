import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/utils/custom_colors.dart';
import 'CategoryCard.dart';
import 'ProductsByCategoryScreen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _calculateCrossAxisCount(double width) {
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().getCategories();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تسوق حسب التصنيف',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesSuccess) {
            final categories = state.categories;

            if (categories.isEmpty) {
              return const Center(child: Text("No categories found."));
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryCard(
                        name: category.name,
                        imageUrl: category.imageUrl ?? '',
                        price: '', // Not needed for categories
                        unit: '',
                        onPressed: () {
                          // In CategoryScreen, inside the GridView.builder
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<ProductsCubit>()..getProductsByCategory(category.code),
                                child: ProductsByCategoryScreen(
                                  categoryName: category.name,
                                  categoryCode: category.code, // Pass categoryCode
                                ),
                              ),
                            ),
                          ).then((_) {
                            // Re-fetch categories when returning to CategoryScreen
                            context.read<ProductsCubit>().getCategories();
                          })



                          ;
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is ProductsFailure) {
            return Center(
              child: Text(
                'Error: ${state.errMessege}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
