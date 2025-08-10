import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/editor_choice_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/editors_choice_header.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/popluer_recipes_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populerRecipesHeader.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: searchTextField(),
          ),
        ),
        SliverToBoxAdapter(child: CategoryListView()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: PopularRecipesHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
                height: 150, child: Expanded(child: PopluerRecipesListView()))),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: EditorsChoiceHeader(),
          ),
        ),
        SliverToBoxAdapter(
            child: Expanded(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: editorChoiceListView(),
        ))),
      ],
    );
  }
}
