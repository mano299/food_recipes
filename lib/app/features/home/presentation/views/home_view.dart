import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/service_locator.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo_impl.dart';
import 'package:food_recipes/app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/manager/featured_cubit/featured_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/manager/meal_cubit/meal_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:food_recipes/app/features/meal/data/repo/recipe_reop_impl.dart';
import 'package:food_recipes/app/features/meal/presentation/manager/recipes/recipe_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesCubit(getIt.get<HomeRepoImpl>())..fetchCategories(),
        ),
        BlocProvider(
          create: (context) =>
              MealCubit(getIt.get<HomeRepoImpl>())..getMealByCategory(),
        ),
        BlocProvider(
          create: (context) => RecipeCubit(getIt.get<recipeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              FeaturedCubit(getIt.get<HomeRepoImpl>())..getFeaturedData(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
