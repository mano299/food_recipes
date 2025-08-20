import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class PopularRecipesHeader extends StatelessWidget {
  const PopularRecipesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Recipes',
          style: Styles.textStyle21(context),
        ),
      ],
    );
  }
}
