import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = "www.themealdb.com/api/json/v1/1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }
}
