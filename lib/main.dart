import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo_impl.dart';
import 'package:food_recipes/app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/home_view.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/Register_cubit/register_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/login_cubits/login_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/login_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(
            create: (context) =>
                CategoriesCubit(HomeRepoImpl(ApiService(Dio())))
                  ..fetchCategories()),
      ],
      child: MaterialApp(
        title: 'Food Recipe',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
