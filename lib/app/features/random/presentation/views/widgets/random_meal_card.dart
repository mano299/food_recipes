
import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class RandomMealCard extends StatelessWidget {
  const RandomMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image(
                  image: AssetImage('assets/photos/Image 1.png',),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(height: 8),
              Text('Sunny Egg & Toast Avocado', style: Styles.textStyle18(context),)
            ],
          ),
        ),
      ),
    );
  }
}
