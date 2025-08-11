import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/home_view.dart';
import 'package:food_recipes/app/features/home/presentation/search_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/category_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/populerRecipesHeader.dart';

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
    const Center(child: Text('Random Meal'),),
    const HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 22,
        ),
        selectedIconTheme: IconThemeData(
          color: kPrimaryColor,
          size: 28,
        ),
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: currentIndex == 0 ? SingleChildScrollView(
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
            
          ],
        ),
      ) : pages[currentIndex],
    );
  }
}
