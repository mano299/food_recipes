import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/home/presentation/widgets/editor_choice_item.dart';

class editorChoiceListView extends StatelessWidget {
  const editorChoiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: EditorChoiceItem(),
          );
        });
  }
}
