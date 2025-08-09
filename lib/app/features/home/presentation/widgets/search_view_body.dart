import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/popluer_recipes_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populerRecipesHeader.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populer_recipes_item.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: searchTextField(),
        ),
        CategoryListView(),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: PopularRecipesHeader(),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(height: 150, child: Expanded(child: PopluerRecipesListView())),
      ],
    );
  }
}
