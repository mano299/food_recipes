import 'package:flutter/material.dart';

class Splitter extends StatelessWidget {
  const Splitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color.fromARGB(255, 222, 230, 231),
      ),
      child: SizedBox(
        height: 8,
        width: 64,
      ),
    );
  }
}
