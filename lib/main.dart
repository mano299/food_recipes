import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/splash/presentation/splash_view.dart';

void main() {
  runApp(const FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Quicksand"),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
