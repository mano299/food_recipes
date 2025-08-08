import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/core/utils/function/show_snak_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPageBody extends StatefulWidget {
  RegisterPageBody({
    super.key,
  });

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  String? name, email, phoneNumber, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
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
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await RegisterUser();
                        ShowSnakBar(
                            context, "Success Register and saving data");
                        setState(() {
                          isLoading = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ShowSnakBar(
                              context, 'The password provided is too weak.');
                          setState(() {
                            isLoading = false;
                          });
                        } else if (e.code == 'email-already-in-use') {
                          ShowSnakBar(context,
                              'The account already exists for that email.');
                          setState(() {
                            isLoading = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                        setState(() {
                          isLoading = false;
                        });
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                        onTap: () async {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xff0A2527),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
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
      ),
    );
  }

  Future<void> RegisterUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    String uid = userCredential.user!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      "FullName": name,
      "PhoneNumber": phoneNumber,
      "Email": email,
      "createdAt": FieldValue.serverTimestamp(),
    });
    log("✅ User data saved in Firestore with UID: $uid");
  }
}
