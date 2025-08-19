import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/welcome_view.dart';
import 'package:food_recipes/app/features/home/presentation/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController logoAnimationController;
  late Animation<Offset> logoSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateAfterSplash();
  }

  void initAnimation() {
    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    logoSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.easeOut,
    ));

    logoAnimationController.forward();
  }

  Future<void> navigateAfterSplash() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? const HomeView() : const WelcomeView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff70b9be),
      body: Center(
        child: SlideTransition(
          position: logoSlidingAnimation,
          child: SvgPicture.asset(
            'assets/photos/foodLogo.svg',
            width: 350,
            height: 350,
          ),
        ),
      ),
    );
  }
}
