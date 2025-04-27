
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/favourites/presentation/views/favourites_view.dart';

class Favourites_widget extends StatelessWidget {
  const Favourites_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FavouritesView.routeName,

        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ), // ShapeDecoration
        child: SvgPicture.asset("assets/images/favorite_outlined.svg"),
      ),
    );

  }
}
