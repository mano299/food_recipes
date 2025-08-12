import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: Styles.textStyle14(context).copyWith(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
