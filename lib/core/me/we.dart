import 'package:ecommerece_fruites/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/entities/product_Entity.dart';
import '../../features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import '../../features/home/presentation/views/ItemDetailsPage.dart';
import '../helper_functions/getDummyData.dart';







class FavoritesGridViewBlocBuilder extends StatelessWidget {
  const FavoritesGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is FavoriteLoaded) {
          // You must convert FavoriteModel to ProductEntity to use FruitItemCard
          final favorites = state.favorites.map((fav) {
            return ProductEntity(
              code: fav.code,
              name: fav.name,
              description: fav.description,
              price: fav.price,
              numberOfCalories: fav.numberOfCalories,
              reviews: [],
              unitAmount: 1,
              categoryCode: '',
              imageUrl: fav.imageUrl,
              isFeatured: false, expirationsMonths: 1,
            );
          }).toList();

          return FavoritesGridView(favorites: favorites);
        } else if (state is FavoriteError) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text("No favorites yet")),
          );
        }
      },
    );

  }
}



























class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({super.key, required this.favorites});

  final List<ProductEntity> favorites;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: favorites.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ItemDetailsView.routeName,
                  arguments: favorites[index]);
            },
            child: FruitItemCard(
              productEntity: favorites[index],
            ),
          ),
        );
      },
    );
  }
}

