import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key, required this.hint, this.onChanged, required this.icon});
  final String hint;
  final Function(String)? onChanged;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Field is required";
          }
          return null;
        },
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: Colors.white,
            size: 26,
          ),
          //suffix: Icon(icon),
          iconColor: Colors.white,
          hint: Text(
            hint,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
