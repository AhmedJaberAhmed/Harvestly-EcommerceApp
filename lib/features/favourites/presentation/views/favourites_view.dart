import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:ecommerece_fruites/features/favourites/presentation/views/widgets/FavouritesViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/cubits/favourites_cubit/favourites_cubit.dart';


class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  static const routeName = "FavouritesView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesCubit(getIt.get<ProductsRepo>()),
      child: const Scaffold(
        body: Favouritesviewbody(),
      ),
    );
  }
}
