import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/favorite_icon.dart';
import 'package:food_recipes/app/features/profile/presentation/manager/cubit/favorites_cubit.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_grid_view_item.dart';

class MyFavoriteGridView extends StatelessWidget {
  const MyFavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FavoriteGridViewItem(
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
        } else if (state is FavoritesLoading) {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
