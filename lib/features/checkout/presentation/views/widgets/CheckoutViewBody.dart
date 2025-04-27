import 'dart:developer';

import 'package:ecommerece_fruites/core/widgets/custom_button.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/payment_entity.dart';
import 'package:ecommerece_fruites/features/checkout/presentation/manager/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../../core/utils/SnackBarUtils.dart';
import '../../../../../core/utils/app_keys.dart';
import '../../../../../core/utils/custom_colors.dart';
import 'CheckoutStepsPageView.dart';
import 'check_out_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  late PageController pageController;

  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.hasClients) {
        final page = pageController.page;
        if (page != null) {
          setState(() {
            currentPageIndex = page.round();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckOutSteps(
            onTap: (index) {
              if (index == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderInputEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(
                      message: "يرجى تحديد طريقة الدفع",
                      backgroundColor: AppColors.primaryColor,
                    ),
                  );
                }
              } else {
                handleAddressValidation();
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: formKey,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                ShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                handleAddressValidation();
              } else {
                processPayment(context);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void processPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: KpayPalClientId,
        secretKey: KpayPalSecretKey,
        transactions: [paypalPaymentEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context);
          addOrderCubit.addOrder(order: orderEntity);
          // showTopSnackBar(
          //   Overlay.of(context),
          //   CustomSnackBar.error(
          //     message: "تمت العملية بنجاح!",
          //     backgroundColor: AppColors.primaryColor,
          //   ),
          // );
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
          log(error.toString());
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: "حدث خطأ في عملية الدفع !",
              backgroundColor: AppColors.primaryColor,
            ),
          );
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));

    // var orderEntity1 = context.read<OrderEntity>();
    // context.read<AddOrderCubit>().addOrder(order: orderEntity1);
  }

  void ShippingSectionValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
      if (currentPageIndex < getSteps().length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    } else {
      showUtilFailTopSnackBar(context, message: "يرجى تحديد طريقة الدفع");
    }
  }

  String getNextButtonText(int index) {
    return index == getSteps().length - 1 ? 'الدفع بواسطة PayPal' : 'التالي';
  }

  void handleAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}
