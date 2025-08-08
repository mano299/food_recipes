
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'See All',
        style: Styles.textStyle18.copyWith(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}