 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_prefrences_singltone.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/presentation/views/sign_in_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.showSkip,
  });

  final String image, backgroundImage;
  final String subTitle;
  final bool showSkip;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SvgPicture.asset(image),
                  ),
                ),
              ),
              if (showSkip)
                Positioned( // ✅ Correctly placed Positioned widget
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(kisOnBoardingViewSeen,true);
                      Navigator.of(context).pushReplacementNamed(SignInView.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "تخط",
                            style: TextStyles.regular13.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ], // <-- ❌ Extra closing parenthesis removed here
          ),
        ),
        const SizedBox(height: 64),
        title,
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SignInView.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13.copyWith(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
