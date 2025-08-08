import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/app/features/home/presentation/home_view.dart';
import 'package:food_recipes/app/features/welcome/welcome_view.dart';

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

    // تأخير الانتقال لمدة 6 ثواني
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeView()),
      );
    });
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
