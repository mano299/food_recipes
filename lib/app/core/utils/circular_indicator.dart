import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: kPrimaryColor,
    );
  }
}
