import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/manager/meal_cubit/meal_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/search_meals_grid_view.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: searchTextField(
              onChange: (value) {
                final cubit = context.read<SearchCubit>();
                if (cubit.allMeals.isEmpty) {
                  cubit.loadAllMeals().then((_) {
                    cubit.searchMeals(value);
                  });
                } else {
                  cubit.searchMeals(value);
                }
                if (value.isEmpty) {}
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SearchMealsGridView(),
        ],
      ),
    );
  }
}
