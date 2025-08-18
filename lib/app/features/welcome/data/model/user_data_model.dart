import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserDataModel {
  final String fullName;
  final String phoneNumber;

  UserDataModel({required this.fullName, required this.phoneNumber});

  factory UserDataModel.fromJson(dynamic data) {
    return UserDataModel(
        fullName: data["FullName"], phoneNumber: data["PhoneNumber"]);
  }
}
