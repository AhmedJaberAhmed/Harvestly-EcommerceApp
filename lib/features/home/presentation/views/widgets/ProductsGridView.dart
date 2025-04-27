import 'package:ecommerece_fruites/core/widgets/fruit_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/entities/product_Entity.dart';
import '../ItemDetailsPage.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 163 / 214),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ItemDetailsView.routeName,
                  arguments: products[index]);
            },
            child: FruitItemCard(
              productEntity: products[index],
            ),
          ),
        );
      },
    );
  }
}
