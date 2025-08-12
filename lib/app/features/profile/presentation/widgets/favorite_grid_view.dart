
import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_grid_view_item.dart';

class MyFavoriteGridView extends StatelessWidget {
  const MyFavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 6.1,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return FavoriteGridViewItem();
      },
    );
  }
}
