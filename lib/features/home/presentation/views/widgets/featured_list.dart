import 'package:ecommerece_fruites/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/cupertino.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const FeaturedItem(),
        )), // Fixed syntax
      ), // Row
    );
  }
}
