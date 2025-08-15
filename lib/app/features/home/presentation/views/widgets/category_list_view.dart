import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/category_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CategoryItem(
                      categoey: state.categories[index].category,
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12);
                },
                itemCount: state.categories.length,
              ),
            ),
          );
        } else if (state is CategoriesFailure) {
          return Text(
            state.errMesage,
            style: Styles.textStyle21(context),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
