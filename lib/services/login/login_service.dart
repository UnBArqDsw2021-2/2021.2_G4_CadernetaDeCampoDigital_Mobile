import 'dart:convert';

import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future login(String cpf, String password) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};

    Map requestParams = {"cpf": cpf, "password": password};

    String bodyRequest = jsonEncode(requestParams);
    Response? loginResponse;
    try {
      loginResponse = await Utils.dio.post(
        "login/",
        data: bodyRequest,
        options: Options(
            headers: header,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );
    } on DioError catch (exception) {
      print(loginResponse?.statusCode);
      print(exception);
    }

    return loginResponse;
  }
}
