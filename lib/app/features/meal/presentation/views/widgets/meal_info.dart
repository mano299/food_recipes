import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingr_and_inst.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/splitter.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Splitter(),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Healthy Taco Salad',
                  style: Styles.textStyle21(context),
                ),
              ),
              SizedBox(height: 6),
              Text(
                'This Healthy Taco Salad is the universal delight of taco night',
                style: Styles.textStyle18(context)
                    .copyWith(color: Color(0xff748189)),
              ),
              SizedBox(height: 16),
              IngredientsAndInstructions()
            ],
          ),
        ),
      ),
    );
  }
}
