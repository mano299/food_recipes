import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/welcome_view_body.dart';
import 'package:food_recipes/constant.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/photos/Create Account Options.svg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: WelcomeViewBody(),
        ),
      ],
    );
  }
}
