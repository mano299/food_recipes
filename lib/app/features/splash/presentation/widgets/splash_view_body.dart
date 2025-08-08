import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    initAnimation();
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff70B9BE),
      body: SlideTransition(
        position: logoSlidingAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset('assets/photos/foodLogo.svg'),
          ],
        ),
      ),
    );
  }

  void initAnimation() {
    logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    logoSlidingAnimation = Tween<Offset>(
      begin: Offset(0, -2),
      end: Offset.zero,
    ).animate(logoAnimationController);
    logoAnimationController.forward();
  }
}
