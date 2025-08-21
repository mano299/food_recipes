import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/function/show_snak_bar.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/Register_cubit/register_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPageBody extends StatelessWidget {
  RegisterPageBody({
    super.key,
  });

  String? name, email, phoneNumber, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          ShowSnakBar(context, "Success Register ,Now You Can Login");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        } else if (state is RegisterFailure) {
          isLoading = false;
          ShowSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: kPrimaryColor,
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
                      maxLength: true,
                      
                      hint: "Phone Number",
                      icon: Icons.phone_iphone_outlined,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    Customtextfield(
                      obscureText: true,
                      hint: "Password",
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
                          BlocProvider.of<RegisterCubit>(context).RegisterUser(
                              email: email!,
                              password: password!,
                              name: name!,
                              phoneNumber: phoneNumber!);

                          // setState(() {
                          //   isLoading = true;
                          // });
                          // try {
                          //   await RegisterUser();
                          //   ShowSnakBar(
                          //       context, "Success Register and saving data");
                          //   setState(() {
                          //     isLoading = false;
                          //   });
                          // } on FirebaseAuthException catch (e) {
                          //   if (e.code == 'weak-password') {
                          //     ShowSnakBar(
                          //         context, 'The password provided is too weak.');
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //   } else if (e.code == 'email-already-in-use') {
                          //     ShowSnakBar(context,
                          //         'The account already exists for that email.');
                          //     setState(() {
                          //       isLoading = false;
                          //     });
                          //   }
                          // } catch (e) {
                          //   print(e);
                          //   setState(() {
                          //     isLoading = false;
                          //   });
                          // }
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
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
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
      },
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
