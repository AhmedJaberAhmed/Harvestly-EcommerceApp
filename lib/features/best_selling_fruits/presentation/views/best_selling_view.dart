import 'package:ecommerece_fruites/features/best_selling_fruits/presentation/views/widgets/BestSellingViewBody.dart';
import 'package:flutter/material.dart';
 import '../../../../core/widgets/BuildAppBar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
static const routeName="BestSellingView";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: BuildAppBar(),
      body: Bestsellingviewbody(),

    );
  }


}
