import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';

class userInputDataSection extends StatelessWidget {
  const userInputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtextfield(hint: "Full Name", icon: Icons.person),
        Customtextfield(hint: "Valied Email", icon: Icons.email),
        Customtextfield(
            hint: "Phone Number", icon: Icons.phone_iphone_outlined),
        Customtextfield(hint: "Strong Password", icon: Icons.lock_outline),
      ],
    );
  }
}
