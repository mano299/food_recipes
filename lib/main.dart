import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/home_view.dart';
import 'package:food_recipes/app/features/splash/presentation/splash_view.dart';
import 'package:food_recipes/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const HomeView(),
    );
  }
}
