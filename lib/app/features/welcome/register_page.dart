import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/register_section.dart';
import 'package:food_recipes/constant.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SvgPicture.asset("assets/photos/foodLogo.svg"),
            Customtextfield(hint: "Full Name", icon: Icons.person),
            Customtextfield(hint: "Valied Email", icon: Icons.email),
            Customtextfield(
                hint: "Phone Number", icon: Icons.phone_iphone_outlined),
            Customtextfield(hint: "Strong Password", icon: Icons.lock_outline),
            SizedBox(
              height: 50,
            ),
            RegisterSection(),
          ],
        ),
      ),
    );
  }
}
