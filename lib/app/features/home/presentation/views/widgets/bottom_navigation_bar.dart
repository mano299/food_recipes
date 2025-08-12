import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 26,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 22,
      ),
      selectedIconTheme: IconThemeData(
        color: kPrimaryColor,
        size: 28,
      ),
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.radar),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: '',
        ),
      ],
    );
  }
}
