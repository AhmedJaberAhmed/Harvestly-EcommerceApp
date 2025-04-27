import 'package:ecommerece_fruites/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'PaymentSection.dart';
import 'address_input_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
    CheckoutStepsPageView({
    super.key,
    required this.pageController, required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: getPages().length,
          itemBuilder: (context, index) {
          return  getPages()[index];
          }),
    );
  }
  List<Widget>getPages(){
    return [
      ShippingSection(),
      AddressInputSection(formKey: formKey,valueListenable:valueListenable ,),
      PaymentSection(pageController: pageController,),

    ];
  }
}
