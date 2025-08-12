
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class RandomCustomButton extends StatelessWidget {
  const RandomCustomButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(150, 50)),
        backgroundColor: WidgetStateProperty.all(kPrimaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle24(context).copyWith(color: Colors.white),
      ),
    );
  }
}