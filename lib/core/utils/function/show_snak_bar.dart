import 'package:flutter/material.dart';

void ShowSnakBar(BuildContext context, String Message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Message)));
}
