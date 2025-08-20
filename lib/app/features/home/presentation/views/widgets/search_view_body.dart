import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/manager/meal_cubit/meal_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PopularListViewItem(mealModel: state.meals[index]);
                  },
                  childCount: state.meals.length,
                ),
              );
            } else if (state is SearchFailure) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    state.errMessage,
                    style: Styles.textStyle21(context),
                  ),
                ),
              );
            } else if (state is SearchLoading) {
              return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return SliverToBoxAdapter(
                child: SizedBox(),
              );
            }
          },
        )
      ],
    );
  }
}
