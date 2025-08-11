import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class RandomViewBody extends StatelessWidget {
  const RandomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Random Meal',
          style: Styles.textStyle28(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}