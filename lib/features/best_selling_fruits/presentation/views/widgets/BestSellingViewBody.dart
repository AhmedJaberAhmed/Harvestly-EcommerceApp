import 'package:flutter/cupertino.dart';

import '../../../../../core/entities/product_Entity.dart';
import '../../../../home/presentation/views/widgets/ProductsGridView.dart';

class Bestsellingviewbody extends StatelessWidget {
  const Bestsellingviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return       CustomScrollView (
      slivers: [
        ProductsGridView(products: [

    ProductEntity(
      categoryCode: "",
    name: 'Apple',
      code: '123',
      description: 'Fresh apple',
      price: 2.5,
      reviews: [],
      expirationsMonths: 6,
      numberOfCalories: 100,
      unitAmount: 1,
      isOrganic: true,
      isFeatured: true,
      imageUrl:
      'https://www.freshnessblogger.com/wp-content/uploads/2020/11/Apple-1.jpg',
    )
        ],)
      ],
    );
  }
}
