import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.isSelected = false});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 119,
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : Color(0xffF1F5F5),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          'Breakfast',
          style: isSelected
              ? Styles.textStyle14(context).copyWith(color: Colors.white)
              : Styles.textStyle14(context),
        )),
      ),
    );
  }
}
