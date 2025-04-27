import 'package:ecommerece_fruites/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HomeViewBody.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }
}
