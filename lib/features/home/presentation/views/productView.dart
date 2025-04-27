import 'package:ecommerece_fruites/features/home/presentation/views/widgets/productViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/get_it_services.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ), // ProductsCubit
      child: const Productviewbody(),
    ); // BlocProvider
  }
}
