import 'package:flutter/material.dart';

class TopPhoto extends StatelessWidget {
  const TopPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Image.asset(
        'assets/photos/testFood.png',
        height: 300,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
