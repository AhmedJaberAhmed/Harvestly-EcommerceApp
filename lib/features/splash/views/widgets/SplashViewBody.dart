 import 'package:ecommerece_fruites/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/shared_prefrences_singltone.dart';
import '../../../../generated/assets.dart';
import '../../../auth/presentation/views/sign_in_view.dart';
import '../../../home/presentation/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesBottomSplash,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kisOnBoardingViewSeen);

    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isLoggedIn = FirebaseAuthService().isLoggedIn();

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });

  }
  }
