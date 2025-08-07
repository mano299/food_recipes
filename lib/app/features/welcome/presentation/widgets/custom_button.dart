import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.label,
  });
  final String label;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xff0A2527), borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
