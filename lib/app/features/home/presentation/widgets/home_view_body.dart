import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/home_view.dart';
import 'package:food_recipes/app/features/home/presentation/search_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populerRecipesHeader.dart';
import 'package:food_recipes/app/features/random/presentation/random_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const SearchView(),
    const RandomView(),
    const Center(child: Text('Profile'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: currentIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                  const SizedBox(height: 12),
                  const CategoryListView(),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: PopularRecipesHeader(),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 270,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const PopularListViewItem();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          : pages[currentIndex],
    );
  }
}
