import 'package:ecommerece_fruites/core/cubits/products_cubit/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/search_text_field.dart';
 import 'ProductsGridViewBlocBuilder.dart';
import 'best_selling_header.dart';
import 'custom_home_appBar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const   HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                CustomHomeAppbar(),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder()

        ],
      ),
    );
  }
}