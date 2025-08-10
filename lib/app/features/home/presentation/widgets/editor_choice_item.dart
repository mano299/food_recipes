import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class EditorChoiceItem extends StatelessWidget {
  const EditorChoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/photos/editor.png",
          height: 84,
        ),
        title: Text(
          "Easy homemade beef burger",
          style: Styles.textStyle18(context),
        ),
        subtitle: Row(
          children: [
            SizedBox(
                height: 20,
                child: Image.asset(
                  "assets/photos/james.png",
                  fit: BoxFit.fill,
                )),
            Text(" James Spader"),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff0A2527)),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
