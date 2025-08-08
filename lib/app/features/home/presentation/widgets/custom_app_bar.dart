
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                color: Color(0xff4D8194),
                size: 26,
              ),
              SizedBox(width: 4),
              Text(
                'Good Morning',
                style: Styles.textStyle18,
              ),
              Spacer(),
              Icon(
                Icons.shopping_cart_outlined,
                size: 28,
              )
            ],
          ),
          Text(
            'Alena Sabyan',
            style: Styles.textStyle28,
          ),
        ],
      ),
    );
  }
}
