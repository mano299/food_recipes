import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class PopularRecipesItem extends StatelessWidget {
  const PopularRecipesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 110,
      decoration: BoxDecoration(
          // boxShadow: [BoxShadow()],
          
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Image.asset("assets/photos/Image 1.png"),
          SizedBox(
            height: 12,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            "Egg & Avocado",
            style: Styles.textStyle14(context),
          ),
        ],
      ),
    );
  }
}
