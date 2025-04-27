import 'package:ecommerece_fruites/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/cupertino.dart';


class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController, required this.onTap,
  });

  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged <int>onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap:(){
              onTap(index);
            },
            child: StepItem(
              index: (index + 1).toString(),
              isActive: index <= currentPageIndex,
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ["الشحن", "العنوان", "الدفع"];
}
