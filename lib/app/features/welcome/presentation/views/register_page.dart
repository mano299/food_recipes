import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';

import 'package:food_recipes/app/features/welcome/presentation/views/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: RegisterPageBody(),
    );
  }
}
