import 'package:ecommerece_fruites/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerece_fruites/core/services/custom_bloc_observer.dart';
import 'package:ecommerece_fruites/core/services/firestore_service.dart';
import 'package:ecommerece_fruites/core/utils/custom_colors.dart';
import 'package:ecommerece_fruites/features/auth/presentation/views/sign_in_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'core/repos/products_repo/products_repo.dart';
import 'core/services/get_it_services.dart';
import 'core/services/shared_prefrences_singltone.dart';
import 'features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'features/home/presentation/cubits/favourites_cubit/favourites_cubit.dart';
import 'features/splash/views/splash_view.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  final appDocumentDir = await getApplicationDocumentsDirectory();

  await Firebase.initializeApp();
  await Prefs.init();
  setupGetIt();

  // Provide CartCubit globally to the app
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ProductsCubit>(create: (context) => ProductsCubit(getIt.get<ProductsRepo>())),
          BlocProvider<CartCubit>(create: (context) => CartCubit()),
          BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit()),
           // Add more providers if needed
        ],
        child: const FruitesHub(),
      )

  );
}


class FruitesHub extends StatelessWidget {
  const FruitesHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'SignInView': (context) => const SignInView(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Cairo",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // Arabic only
      ],
      locale: const Locale('ar'),
      // Set Arabic as default
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}