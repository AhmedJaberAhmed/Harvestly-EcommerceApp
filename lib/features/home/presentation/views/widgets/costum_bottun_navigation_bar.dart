import 'package:ecommerece_fruites/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';

import 'NavigationBarItem.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  final int selectedIndex;
  final Function(int) onTabTapped;  // Callback function to notify on tab tap

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                onTabTapped(index);  // Notify the parent view about the tab change
              },
              child: NavigationBarItem(
                isSelected: selectedIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
