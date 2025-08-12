import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class EditorChoiceItem extends StatelessWidget {
  const EditorChoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, 
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/photos/editor.png",
              height: 100,
              width: 120,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Easy homemade beef burger",
              style: Styles.textStyle18(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kTextColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
