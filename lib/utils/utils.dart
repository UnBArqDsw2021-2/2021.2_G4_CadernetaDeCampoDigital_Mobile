import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Utils {
  static Dio dio =
      Dio(BaseOptions(baseUrl: "https://ccd-backend.herokuapp.com/api/"));

  static final TextStyle estateTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'Roboto-Regular',
  );

  final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskData = MaskTextInputFormatter(
    mask: "##/##/####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskTelefone = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskCrea = MaskTextInputFormatter(
    mask: "#########-#",
    filter: {"#": RegExp(r'[0-9]')},
  );

  String? clearMask(String? string) {
    String newString = string!.replaceAll(RegExp(r'[\s\.\-\(\)]+'), '');

    return newString;
  }

  String? clearData(String? data) {
    var newData = data!.split("/");

    return (newData.reversed).join("-");
  }

  Utils();
}
