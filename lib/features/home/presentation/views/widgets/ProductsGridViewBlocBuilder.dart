import 'package:ecommerece_fruites/core/cubits/products_cubit/products_cubit.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_functions/getDummyData.dart';
import 'CustromErrorWidger.dart';
import 'ProductsGridView.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Custromerrorwidget(
              text: state.errMessege,
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ),
          );
        } },
    );
  }
}
