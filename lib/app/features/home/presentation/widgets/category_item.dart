
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 119,
      decoration: BoxDecoration(
        color: Color(0xffF1F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          'Breakfast',
          style: Styles.textStyle18,
        )),
      ),
    );
  }
}