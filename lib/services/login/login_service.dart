import 'dart:convert';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future login(String cpf, String password) async {
    // Map<String, dynamic> header = {"Content-Type": "application/json"};

    Map requestParams = {"cpf": cpf, "password": password};

    String bodyRequest = jsonEncode(requestParams);
    Response? loginResponse;
    try {
      loginResponse = await DioClient.dioClient.post(
        "login/",
        bodyRequest,
      );
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return loginResponse;
  }
}
