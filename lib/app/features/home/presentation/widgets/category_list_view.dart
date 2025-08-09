import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int selectedIndex  = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CategoryItem(isSelected: selectedIndex == index,),
            );
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
