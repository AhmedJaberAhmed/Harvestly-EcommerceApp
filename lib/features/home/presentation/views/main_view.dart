import 'dart:convert';

import 'package:ecommerece_fruites/core/repos/products_repo/products_repo.dart';
import 'package:ecommerece_fruites/core/services/get_it_services.dart';
import 'package:ecommerece_fruites/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/cart_view.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/productView.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/widgets/HomeView.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/widgets/MainViewBodyBolcConsumer.dart';
import 'package:ecommerece_fruites/features/home/presentation/views/widgets/costum_bottun_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
 import '../../../profile/AccountPage.dart';
import '../cubits/favourites_cubit/favourites_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'HomeView';

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
     
    HomeView(),
    ProductsView(),
    CartView(),
    AccountPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        bottomNavigationBar: CustomButtonNavigationBar(
          selectedIndex: selectedIndex,
          onTabTapped: onTabTapped,
        ),
        body: SafeArea(
          child: MainViewBodyBolcConsumer(
            selectedIndex: selectedIndex,
            pages: _pages,
          ),
        ),

    );
  }
}

