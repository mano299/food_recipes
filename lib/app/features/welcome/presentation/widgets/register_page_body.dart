import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/core/utils/function/show_snak_bar.dart';

class RegisterPageBody extends StatelessWidget {
  RegisterPageBody({
    super.key,
  });
  String? name, email, phoneNumber, password;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset("assets/photos/foodLogo.svg"),
              Customtextfield(
                hint: "Full Name",
                icon: Icons.person,
                onChanged: (value) {
                  name = value;
                },
              ),
              Customtextfield(
                hint: "Valied Email",
                icon: Icons.email,
                onChanged: (value) {
                  email = value;
                },
              ),
              Customtextfield(
                hint: "Phone Number",
                icon: Icons.phone_iphone_outlined,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              Customtextfield(
                hint: "Strong Password",
                icon: Icons.lock_outline,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                label: "Register",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await RegisterUser();

                      log("message");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ShowSnakBar(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ShowSnakBar(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),
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
                      onTap: () async {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color(0xff0A2527)),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> RegisterUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
