import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/meal/data/repo/recipe_reop_impl.dart';
import 'package:food_recipes/app/features/meal/presentation/manager/recipes/recipe_cubit.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/meal_view_body.dart';

class MealView extends StatelessWidget {
  final String mealId;

  const MealView({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RecipeCubit(
      recipeRepoImpl(ApiService(Dio())) 
    )..getRecipeById(mealId),
  child: MealViewBody(),
);
  }
}
