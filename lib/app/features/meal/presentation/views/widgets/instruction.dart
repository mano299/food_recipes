import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/manager/recipes/recipe_cubit.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/youtube_button.dart';

class Insrtuctions extends StatelessWidget {
  const Insrtuctions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is getRecipeSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubeButton(),
              const SizedBox(height: 20),
              Text(
                'Instruction:',
                style: Styles.textStyle21(context),
              ),
              const SizedBox(height: 10),
              Text(
                state.recipe[0].strInstructions,
                style: Styles.textStyle18(context),
              ),
            ],
          );
        } else {
          return Text('data');
        }
      },
    );
  }
}
