import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view_item.dart';

class HomrViewBody extends StatelessWidget {
  const HomrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: 24),
            Text(
              'Featured',
              style: Styles.textStyle26,
            ),
            SizedBox(height: 8),
            FeaturedListViewItem()
          ],
        ),
      ),
    );
  }
}

