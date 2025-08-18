import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/features/meal/presentation/manager/recipes/recipe_cubit.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredient_list_view_item.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is getRecipeSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.recipe[0].ingredients.length,
            itemBuilder: (context, index) => IngredientListViewItem(
              mealIngredient: state.recipe[0].ingredients[index],
            ),
          );
        } else if (state is getRecipeFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return CircularIndicator();
        }
      },
    );
  }
}
