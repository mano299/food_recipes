
import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredient_list_view_item.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => IngredientListViewItem(),
      ),
    );
  }
}
