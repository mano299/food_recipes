import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/featured_list_view_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.23,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FeaturedListViewItem(),
            );
          },
        ),
      ),
    );
  }
}
