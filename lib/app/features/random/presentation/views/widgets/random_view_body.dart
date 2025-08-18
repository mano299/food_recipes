import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/random/presentation/views/manager/random_cubit/random_cubit.dart';
import 'package:food_recipes/app/features/random/presentation/views/widgets/random_custom_button.dart';
import 'package:food_recipes/app/features/random/presentation/views/widgets/random_meal_card.dart';

class RandomViewBody extends StatelessWidget {
  const RandomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Random Meal',
          style: Styles.textStyle28(context).copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<RandomCubit, RandomState>(
              builder: (context, state) {
                if (state is RandomSuccess) {
                  return RandomMealCard(
                    mealId: state.meal.mealId,
                    photo: state.meal.mealImage ?? '',
                    mealName: state.meal.mealName,
                  );
                } else if (state is RandomFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(height: 24),
            RandomCustomButton(
              text: 'Generate Random Meal',
            ),
          ],
        ),
      ),
    );
  }
}
