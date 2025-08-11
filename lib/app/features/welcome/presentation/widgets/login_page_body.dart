import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipes/app/core/utils/function/show_snak_bar.dart';
import 'package:food_recipes/app/features/home/presentation/home_view.dart';
import 'package:food_recipes/app/features/welcome/presentation/cubit/login_cubits/login_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/cubit/login_cubits/login_state.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_button.dart';
import 'package:food_recipes/app/features/welcome/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/app/features/welcome/presentation/register_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody({
    super.key,
  });

  String? name, email, phoneNumber, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeView();
          }));
        } else if (state is LoginFailure) {
          isLoading = false;
          ShowSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
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
                      hint: "Email",
                      icon: Icons.email,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    Customtextfield(
                      hint: "Password",
                      icon: Icons.lock_outline,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .15,
                    ),
                    CustomButton(
                      label: "Login",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          // setState(() {
                          //   isLoading = true;
                          // });
                          // try {
                          //   await LoginUser();
                          //   (context, "SUCCESSFUL");
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) {
                          //     return HomeView();
                          //   }));
                          //   setState(() {
                          //     isLoading = false;
                          //   });
                          // } on FirebaseAuthException catch (e) {
                          //   if (e.code == 'user-not-found') {
                          //     ShowSnakBar(
                          //         context, 'No user found for that email.');
                          //   } else if (e.code == 'wrong-password') {
                          //     ShowSnakBar(context,
                          //         'Wrong password provided for that user.');
                          //   }
                          // } catch (e) {
                          //   ShowSnakBar(context, e.toString());
                          // }
                          // setState(() {
                          //   isLoading = false;
                          // });

                          BlocProvider.of<LoginCubit>(context)
                              .LoginUser(email: email!, password: password!);
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
                          "Don't have an account ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                            child: Text(
                              "Register",
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

  // Future<void> LoginUser() async {
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  // }
}
