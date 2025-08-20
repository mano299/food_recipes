
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/search_meal_item.dart';

class SearchMealsGridView extends StatelessWidget {
  const SearchMealsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SearchMealItem(
                  mealModel: state.meals[index],
                );
              },
              childCount: state.meals.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: .66,
            ),
          );
        } else if (state is SearchLoading) {
          return SliverToBoxAdapter(
              child: Center(child: CircularIndicator()));
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
