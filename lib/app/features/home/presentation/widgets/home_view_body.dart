import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populerRecipesHeader.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Featured',
                style: Styles.textStyle21(context),
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
                  Text(
                    'Category',
                    style: Styles.textStyle21(context),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: Styles.textStyle14(context).copyWith(
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
              child: PopularRecipesHeader(),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 270,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PopularListViewItem();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
