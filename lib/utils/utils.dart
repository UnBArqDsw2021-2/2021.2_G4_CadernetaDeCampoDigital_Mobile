import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Utils {
  static Dio dio =
      Dio(BaseOptions(baseUrl: "https://ccd-backend.herokuapp.com/api/"));

  static final TextStyle estateTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'Roboto-Regular',
  );

  Utils();
}
