import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/features/home/presentation/manager/featured_cubit/featured_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/featured_list_view_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FeaturedListViewItem(
                      mealId: state.meals[index].mealId,
                      photo: state.meals[index].mealImage ?? '',
                      mealName: state.meals[index].mealName,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is FeaturedFailured) {
          return Center(
            child: Text(state.errMeassage),
          );
        } else {
          return Center(
            child: CircularIndicator(),
          );
        }
      },
    );
  }
}
