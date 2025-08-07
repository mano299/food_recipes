import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(label: "Register"),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already a member ",
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
                onTap: () {},
                child: Text(
                  "Login",
                  style: TextStyle(color: Color(0xff0A2527)),
                ))
          ],
        )
      ],
    );
  }
}
