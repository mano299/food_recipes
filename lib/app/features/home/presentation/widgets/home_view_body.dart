import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/see_all_button.dart';

class HomrViewBody extends StatelessWidget {
  const HomrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Featured',
              style: Styles.textStyle26,
            ),
          ),
          const SizedBox(height: 12),
          const FeaturedListView(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: Styles.textStyle26,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: Styles.textStyle18.copyWith(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          CategoryListView(),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Recipes',
                  style: Styles.textStyle26,
                ),
                SeeAllButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


