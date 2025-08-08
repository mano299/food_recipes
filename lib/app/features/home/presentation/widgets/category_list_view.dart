
import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 12);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}