
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class IngredientsHeader extends StatelessWidget {
  const IngredientsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style:
              Styles.textStyle24(context).copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '6 Items',
          style: Styles.textStyle18(context).copyWith(
            color: Color(0xff748189),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
