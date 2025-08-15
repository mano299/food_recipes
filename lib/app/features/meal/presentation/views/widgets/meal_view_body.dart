import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/top_photo.dart';

class MealViewBody extends StatelessWidget {
  const MealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [TopPhoto(), MealInfo()],
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
          borderRadius: BorderRadius.circular(16),
          color: Colors.green,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
