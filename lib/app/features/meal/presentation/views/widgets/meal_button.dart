import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class MealButton extends StatelessWidget {
  const MealButton({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final BorderRadius borderRadius;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kTextColor : const Color(0xffE6EBF2),
          borderRadius: borderRadius,
        ),
        child: TextButton(
          onPressed: onTap,
          child: Text(
            text,
            style: Styles.textStyle18(context).copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
