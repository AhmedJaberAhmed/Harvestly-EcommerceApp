
import 'package:flutter/cupertino.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.selectedIndex,
    required List<Widget> pages,
  }) : _pages = pages;

  final int selectedIndex;
  final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex, // Keeps the state of each page
      children: _pages,
    );
  }
}

