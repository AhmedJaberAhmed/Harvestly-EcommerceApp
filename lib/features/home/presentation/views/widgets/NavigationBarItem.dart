import 'package:flutter/cupertino.dart';

import '../../../domain/entities/bottom_navigation_bar_entity.dart';
import 'ActiveBottomnavigationbar.dart';
import 'InActiveBottomnavigationbar.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
