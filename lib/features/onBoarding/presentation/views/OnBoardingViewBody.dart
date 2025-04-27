import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerece_fruites/core/widgets/custom_button.dart';
import 'package:ecommerece_fruites/features/onBoarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/services/shared_prefrences_singltone.dart';
import '../../../../core/utils/custom_colors.dart';
import '../../../auth/presentation/views/sign_in_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnboardingPageView(pageController: pageController),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: currentPage.round(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        if (currentPage == 1)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
                onPressed: () {
                  Prefs.setBool(kisOnBoardingViewSeen,true);

                  Navigator.of(context)
                      .pushReplacementNamed(SignInView.routeName);
                },
                text: "ابدأ الآن"),
          ),
        currentPage == 0
            ? SizedBox(height: 85)
            : SizedBox(
                height: 0,
                width: 0,
              )
      ],
    );
  }
}
