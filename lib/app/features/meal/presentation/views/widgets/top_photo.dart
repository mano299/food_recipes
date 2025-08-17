import 'package:flutter/material.dart';

class TopPhoto extends StatelessWidget {
  const TopPhoto({
    super.key, required this.photo
  });
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Image.network(
        photo,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
