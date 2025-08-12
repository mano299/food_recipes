import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/see_all_button.dart';

class EditorsChoiceHeader extends StatelessWidget {
  const EditorsChoiceHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Editor’s Choice',
          style: Styles.textStyle21(context),
        ),
        SeeAllButton(
          text: "View All",
        ),
      ],
    );
  }
}
