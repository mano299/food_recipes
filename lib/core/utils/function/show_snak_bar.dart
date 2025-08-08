import 'package:flutter/material.dart';

void ShowSnakBar(BuildContext context, String Message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    Message,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
  )));
}
