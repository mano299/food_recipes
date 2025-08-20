import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:food_recipes/app/features/home/presentation/manager/meal_cubit/meal_cubit.dart';
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
          BlocProvider.of<MealCubit>(context).categories = state.categories;
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
                        BlocProvider.of<MealCubit>(context).category =
                            state.categories[index].category;
                        BlocProvider.of<MealCubit>(context).getMealByCategory();
                        //       BlocProvider.of<LoginCubit>(context).x = state.categories[index].category;
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
          return Center(
            child: Text(
              state.errMesage,
              style: Styles.textStyle21(context),
            ),
          );
        } else {
          return Center(child: CircularIndicator());
        }
      },
    );
  }
}
