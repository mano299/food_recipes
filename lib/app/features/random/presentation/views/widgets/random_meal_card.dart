import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class RandomMealCard extends StatelessWidget {
  const RandomMealCard({super.key, required this.photo, required this.mealName});
  final String photo;
  final String mealName;
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
                  image: NetworkImage(
                    photo,
                    
                  ),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(height: 8),
              Text(
                mealName,
                style: Styles.textStyle18(context),
                maxLines: 2, // 🔥 يمنع النص من إنه يخرج برا
                overflow: TextOverflow.ellipsis, // 🔥 يحط ... لو الاسم طويل
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
