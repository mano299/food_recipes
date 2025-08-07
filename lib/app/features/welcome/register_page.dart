import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/register_section.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/user_input_data_section.dart';
import 'package:food_recipes/constant.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset("assets/photos/foodLogo.svg"),
              userInputDataSection(),
              SizedBox(
                height: 50,
              ),
              RegisterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
