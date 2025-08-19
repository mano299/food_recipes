import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/service_locator.dart';
import 'package:food_recipes/app/features/home/presentation/views/home_view.dart';
import 'package:food_recipes/app/features/splash/presentation/views/splash_view.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/Register_cubit/register_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/login_cubits/login_cubit.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/user_data_cubit/user_data_cubit.dart';
import 'package:food_recipes/firebase_options.dart';
import 'package:food_recipes/simple_bloc_observer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const FoodRecipe());
}

class FoodRecipe extends StatelessWidget {
  const FoodRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => UserDataCubit()..getUserData()),
      ],
      child: MaterialApp(
        title: 'Tasty',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
