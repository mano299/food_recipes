import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populer_recipes_item.dart';

class PopluerRecipesListView extends StatelessWidget {
  const PopluerRecipesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 24.0),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: PopularRecipesItem(),
          );
        });
  }
}
