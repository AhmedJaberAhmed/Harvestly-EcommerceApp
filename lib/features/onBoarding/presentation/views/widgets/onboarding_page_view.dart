import 'package:ecommerece_fruites/core/utils/custom_colors.dart';
import 'package:ecommerece_fruites/features/onBoarding/presentation/views/widgets/pageviewItem.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        double textScaleFactor = screenWidth / 400;

        return PageView(
          controller: pageController,
          children: [
            PageViewItem(
              showSkip: true,
              image: Assets.imagesPage2viewimage,
              backgroundImage: Assets.imagesPageViewItem1BackgroundImageee,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fruit',
                        style: TextStyles.bold23.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 24 * textScaleFactor,
                        ),
                      ),
                      Text(
                        'HUB',
                        style: TextStyles.bold23.copyWith(
                          color: AppColors.secondaryColor,
                          fontSize: 24 * textScaleFactor,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'مرحبًا بك في',
                        style: TextStyles.bold23.copyWith(
                          fontSize: 20 * textScaleFactor,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
              subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            ),
            PageViewItem(
              showSkip: false,
              image: Assets.imagesPageview1image,
              backgroundImage: Assets.imagesPageview1back,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fruits HUB ',
                        style: TextStyle(
                          fontSize: 32 * textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'ابحث وتسوق في',
                        style: TextStyle(
                          fontSize: 28 * textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
              subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            ),
          ],
        );
      },
    );
  }
}