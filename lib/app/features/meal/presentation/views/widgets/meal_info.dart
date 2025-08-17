import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingr_and_inst.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredients_header.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/ingredients_list_view.dart';
import 'package:food_recipes/app/features/meal/presentation/views/widgets/splitter.dart';

class MealInfo extends StatelessWidget {
  const MealInfo({super.key, required this.mealName, required this.mealTags, required this.mealArea});
  final String mealName;
  final String mealTags;
  final String mealArea;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: Splitter(),
                ),
                SizedBox(height: 8),
                Text(
                  mealName,
                  style: Styles.textStyle21(context),
                ),
                SizedBox(height: 6),
                Text(
                  mealTags,
                  style: Styles.textStyle18(context)
                      .copyWith(color: Color(0xff748189)),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.location_on,size: 28),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      mealArea,
                      style: Styles.textStyle18(context),
                    )
                  ],
                ),
                SizedBox(height: 16),
                IngredientsAndInstructions(),
                SizedBox(height: 16),
                IngredientsHeader(),
                IngredientsListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
