import 'package:ecommerece_fruites/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerece_fruites/core/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/Notification_widget.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'ProductViewHeader.dart';
import 'ProductsGridViewBlocBuilder.dart';

class Productviewbody extends StatefulWidget {
  const Productviewbody({super.key});

  @override
  State<Productviewbody> createState() => _ProductviewbodyState();
}

class _ProductviewbodyState extends State<Productviewbody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Ensure proper alignment
                  children: [
                    Expanded(
                      child: buildAppBar(context,
                          title: "المنتجات", showBackButton: false),
                    ),
                    Favourites_widget(),
                    // Ensure this widget is properly implemented
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                ProductViewHeader(
                  productLenght: context.read<ProductsCubit>().productLenght,
                ),
                SizedBox(
                  height: 12,
                ),
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
