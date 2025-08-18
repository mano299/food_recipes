import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredients_list_view.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/instruction.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/meal_button.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredients_header.dart';
import 'package:url_launcher/url_launcher.dart';

class IngredientsAndInstructions extends StatefulWidget {
  const IngredientsAndInstructions({super.key});

  @override
  State<IngredientsAndInstructions> createState() =>
      _IngredientsAndInstructionsState();
}

class _IngredientsAndInstructionsState
    extends State<IngredientsAndInstructions> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MealButton(
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
            MealButton(
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
          ],
        ),
        const SizedBox(height: 20),
        if (selectedIndex == 0) ...[
          const Align(
            alignment: Alignment.centerLeft,
            child: IngredientsHeader(),
          ),
          const IngredientsListView(),
        ] else
          Insrtuctions(),
      ],
    );
  }
}
