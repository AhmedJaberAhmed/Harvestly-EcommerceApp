import 'package:ecommerece_fruites/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/entities/product_Entity.dart';
import '../../features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import '../../features/home/presentation/views/ItemDetailsPage.dart';
import '../helper_functions/getDummyData.dart';


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


class FavoritesGridViewBlocBuilder extends StatelessWidget {
  const FavoritesGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesSuccess) {
          return FavoritesGridView(
            favorites: state.favourites,
          );
        } else if (state is FavouritesFailure) {
          return Text(state.errMessage);
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: FavoritesGridView(
              favorites: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
