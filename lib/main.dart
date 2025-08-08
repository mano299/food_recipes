import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/splash/presentation/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
