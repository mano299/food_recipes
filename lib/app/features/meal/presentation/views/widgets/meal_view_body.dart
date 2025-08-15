import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/top_photo.dart';

class MealViewBody extends StatelessWidget {
  const MealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TopPhoto(),
          MealInfo(),
        ],
      ),
    );
  }
}

class MealInfo extends StatelessWidget {
  const MealInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Healthy Taco Salad',
                style: Styles.textStyle21(context),
              ),
              Text(
                'This Healthy Taco Salad is the universal delight of taco night View More',
                style: Styles.textStyle18(context)
                    .copyWith(color: Color(0xff748189)),
              ),
              IngredientsAndInstructions()
            ],
          ),
        ),
      ),
    );
  }
}

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
    return Row(
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
    );
  }
}

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

class MealSelector extends StatefulWidget {
  const MealSelector({super.key});

  @override
  State<MealSelector> createState() => _MealSelectorState();
}

class _MealSelectorState extends State<MealSelector> {
  int selectedIndex = 0; // افتراضياً أول زر مختار

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