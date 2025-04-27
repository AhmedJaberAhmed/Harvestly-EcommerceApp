import 'package:ecommerece_fruites/features/splash/views/widgets/SplashViewBody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
 static const routeName="splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
