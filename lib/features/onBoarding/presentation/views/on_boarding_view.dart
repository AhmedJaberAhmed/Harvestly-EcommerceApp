import 'package:flutter/material.dart';

import 'OnBoardingViewBody.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
static const routeName='OnBoarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(child: OnBoardingViewBody()) ,
    );
  }
}
