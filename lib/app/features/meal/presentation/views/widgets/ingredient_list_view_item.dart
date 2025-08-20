import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class IngredientListViewItem extends StatelessWidget {
  const IngredientListViewItem({
    super.key,
    required this.mealIngredient,
    required this.mealIngredientMeasure,
  });
  final String mealIngredient;
  final String mealIngredientMeasure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(6, 6),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(
                'https://www.themealdb.com/images/ingredients/$mealIngredient.png',
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Expanded(
                  child: Text(
                mealIngredient,
                style: Styles.textStyle18(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              SizedBox(width: 12),
              Text(mealIngredientMeasure, style: Styles.textStyle16(context)),
            ],
          ),
        ),
      ),
    );
  }
}
