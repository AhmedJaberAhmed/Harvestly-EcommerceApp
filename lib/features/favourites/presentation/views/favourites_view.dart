import 'package:ecommerece_fruites/features/favourites/presentation/views/widgets/FavouritesViewBody.dart';
import 'package:flutter/material.dart';


class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  static const routeName = "FavouritesView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Favouritesviewbody(),
    );
  }
}
