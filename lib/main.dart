import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/splash_view/splash_view.dart';

void main() {
  runApp(const FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}