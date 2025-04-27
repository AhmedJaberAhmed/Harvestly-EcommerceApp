import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/favourites/presentation/views/favourites_view.dart';
import '../../features/home/domain/entities/cartEntity.dart';
import '../../features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import '../../features/home/presentation/views/ItemDetailsPage.dart';
import '../../features/home/presentation/views/cart_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/onBoarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/views/splash_view.dart';
import '../entities/product_Entity.dart';
import '../widgets/page _display_terms_and_condtions.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());


    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => CheckoutView(
        cartEntity: settings.arguments as CartEntity,
      ));



    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());




    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());







    case FavouritesView.routeName:
      return MaterialPageRoute(builder: (context) => const FavouritesView());









    case ItemDetailsView.routeName:
      final product = settings.arguments as ProductEntity;
      return MaterialPageRoute(
        builder: (context) => ItemDetailsView(productEntity: product),
      );



    case TermsConditionsPage.routeName:
      return MaterialPageRoute(
          builder: (context) => const TermsConditionsPage());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
