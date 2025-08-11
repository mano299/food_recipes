import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.blue,
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shuffle),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: ''
        ),
      ],
    );
  }
}
