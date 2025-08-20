import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/features/meal/presentation/manager/recipes/recipe_cubit.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/back_icon.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/favorite_icon.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/meal_info.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/top_photo.dart';

class MealViewBody extends StatelessWidget {
  const MealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is getRecipeSuccess) {
            final recipe = state.recipe;
            return Column(
              children: [
                Stack(
                  children: [
                    TopPhoto(
                      photo: recipe.isNotEmpty
                          ? recipe[0].strMealThumb
                          : 'https://via.placeholder.com/150',
                    ),
                    Positioned(top: 40, left: 16, child: BackIcon()),
                    Positioned(
                        top: 40,
                        right: 16,
                        child: FavoriteIcon(
                          meal: state.recipe[0],
                        )),
                  ],
                ),
                MealInfo(
                  mealName: recipe[0].strMeal,
                  mealTags: recipe[0].strTags ?? '',
                  mealArea: recipe[0].strArea,
                ),
              ],
            );
          } else if (state is getRecipeFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: CircularIndicator());
          }
        },
      ),
    );
  }
}
