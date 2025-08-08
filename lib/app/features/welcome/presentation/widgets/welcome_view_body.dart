import 'package:flutter/material.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/login_page.dart';
import 'package:food_recipes/app/features/welcome/register_page.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Later",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .6,
        ),
        Text(
          "Help your path to health goals with happiness",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: CustomButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
            label: "Login",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegisterPage();
                },
              ),
            );
          },
          child: Text(
            "Create New Account",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
