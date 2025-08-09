import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.height * 0.34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/photos/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 56, right: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Asian white noodle \nwith extra seafood',
            style: Styles.textStyle21(context).copyWith(color: Colors.white),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
