import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width-32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
      
              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: itemWidth*0.4
                  , child: Image.asset("assets/images/Strawberry.jpg",
                  fit: BoxFit.fill)),
              Container(
                width: itemWidth * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        Svg("assets/images/featured_item_background.svg"))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ), // Text
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Spacer(),
                      FeaturedItemButton(
                        onPressed: () {},
                      ),
                      SizedBox(height: 29)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}