import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_text_styles.dart';
import '../utils/custom_colors.dart';
import 'CustomNetworkImage.dart';

class FruitItemCard extends StatelessWidget {
  const FruitItemCard({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use available width to adjust child elements
        double imageHeight = constraints.maxWidth * 0.5; // 50% of card width

        return Stack(
          children: [
            Container(
              decoration: const ShapeDecoration(
                color: Color(0xFFF3F5F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Product Image
                  Container(
                    height: imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: productEntity.imageUrl != null
                          ? CustomNetworkImage(
                              imageUrl: productEntity.imageUrl!)
                          : Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product Name
                  Text(
                    productEntity.name,
                    style: TextStyles.semiBold13,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Product Price
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " ${productEntity.price}",
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " جنيه ",
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: "/ كيلو",
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),

                  const Spacer(),

                  // Add to Cart Button
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addProduct(productEntity);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Favorite Button
            Positioned(
              top: 8,
              right: 8,
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  final cubit = FavoriteCubit.get(context);

                  return FutureBuilder<bool>(
                    future: cubit.isFavorite(productEntity.code),
                    builder: (context, snapshot) {
                      final isFav = snapshot.data ?? false;

                      return IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          final favModel = FavoriteModel(
                            code: productEntity.code,
                            name: productEntity.name,
                            description: productEntity.description,
                            price: productEntity.price,
                            numberOfCalories: productEntity.numberOfCalories,
                            imageUrl: productEntity.imageUrl
                          );

                          await cubit.toggleFavorite(favModel);

                        },
                      );
                    },
                  );
                },
              )

            ),
          ],
        );
      },
    );
  }
}

void showFavoriteSnackbar(BuildContext context, bool isAdded) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            isAdded ? Icons.favorite : Icons.favorite_border,
            color: isAdded ? Colors.red : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            isAdded ? "تمت الإضافة إلى المفضلة" : "تمت الإزالة من المفضلة",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: isAdded ? Colors.green : Colors.red,
      duration: const Duration(seconds: 2),
    ),
  );
}
