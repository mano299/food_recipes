import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/meal_button.dart';

class MealSelector extends StatefulWidget {
  const MealSelector({super.key});

  @override
  State<MealSelector> createState() => _MealSelectorState();
}

class _MealSelectorState extends State<MealSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MealButton(
            text: 'Ingredients',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            isSelected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
        ),
        Expanded(
          child: MealButton(
            text: 'Instructions',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            isSelected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
        ),
      ],
    );
  }
}
