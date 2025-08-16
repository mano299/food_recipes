
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class IngredientListViewItem extends StatelessWidget {
  const IngredientListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
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
              Image.asset(
                'assets/photos/Image 1.png',
                height: 64,
                width: 64,
              ),
              SizedBox(width: 16),
              Text('Avocado', style: Styles.textStyle18(context)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text('2 cups', style: Styles.textStyle18(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
