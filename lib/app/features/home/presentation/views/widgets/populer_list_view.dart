import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/manager/meal_cubit/meal_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/popular_list_view_item.dart';

class PopulerListView extends StatelessWidget {
  const PopulerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealSuccess) {
          return ListView.builder(
            itemCount: state.meals.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return PopularListViewItem(
                mealModel: state.meals[index],
              );
            },
          );
        } else if (state is MealFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.textStyle21(context),
            ),
          );
        } else {
          return Center(child: CircularIndicator());
        }
      },
    );
  }
}
