import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/utils/custom_colors.dart';
import '../../../home/presentation/views/ItemDetailsPage.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final String categoryName;
  final String categoryCode;

  const ProductsByCategoryScreen({
    super.key,
    required this.categoryName,
    required this.categoryCode,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().getProductsByCategory(categoryCode);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor, // Primary color for app bar
        title: Text(
          'منتجات $categoryName',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white, // Set title text color to white
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final isLoading = state is ProductsLoading;

          return ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: const SizedBox.shrink(),  // No progress indicator needed
            child: Builder(
              builder: (context) {
                if (state is ProductsSuccess) {
                  final products = state.products;
                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        'لا توجد منتجات في هذا التصنيف.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,  // 2 items per row
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.7,  // Adjust based on your design
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final product = products[index];
                            return FadeInUp(
                              duration: Duration(milliseconds: 300 + (index * 100)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ItemDetailsView.routeName,
                                    arguments: product,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: product.imageUrl ?? '',
                                          width: double.infinity,
                                          height: 160,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Container(
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child: CircularProgressIndicator(strokeWidth: 2),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                            color: Colors.grey[200],
                                            child: const Icon(
                                              Icons.error_outline,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${product.price}ج.م',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.secondaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: products.length,
                        ),
                      ),
                    ],
                  );
                } else if (state is ProductsFailure) {
                  return Center(
                    child: Text(
                      'خطأ: ${state.errMessege}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                // When ProductsLoading is in progress, show shimmer
                if (isLoading) {
                  return CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 160,
                                      color: Colors.grey[300],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 16,
                                            color: Colors.grey[300],
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            width: 80,
                                            height: 14,
                                            color: Colors.grey[300],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: 6, // Show 6 placeholder items
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
