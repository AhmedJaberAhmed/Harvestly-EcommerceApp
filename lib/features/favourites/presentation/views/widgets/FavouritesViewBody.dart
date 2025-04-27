 import 'package:ecommerece_fruites/features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/me/we.dart';
import '../../../../../core/widgets/Notification_widget.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/search_text_field.dart';

class Favouritesviewbody extends StatefulWidget {
  const Favouritesviewbody({super.key});

  @override
  State<Favouritesviewbody> createState() => _FavouritesviewbodyState();
}

class _FavouritesviewbodyState extends State<Favouritesviewbody> {
  @override
  void initState() {
    context.read<FavouritesCubit>().getFavouritesToFireBse();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: buildAppBar(context,
                          title: "المفضلة", showBackButton: false),
                    ),
                   // const Favourites_widget(),
                  ],
                ),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
              ],
            ),
          ),
          SliverToBoxAdapter(

          ),
          FavoritesGridViewBlocBuilder()
        ],
      ),
    );
  }
}
