import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/meal_info.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/top_photo.dart';

class MealViewBody extends StatelessWidget {
  const MealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopPhoto(),
          MealInfo(),
          
        ],
      ),
    );
  }
}
