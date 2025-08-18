import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/views/meal_view.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem(
      {super.key, required this.photo, required this.mealName, required this.mealId});
  final String photo;
  final String mealName;
  final String mealId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealView(mealId: mealId),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.height * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(photo),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, top: 56, right: 16, bottom: 16),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(mealName,
                style: Styles.textStyle21(context).copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
