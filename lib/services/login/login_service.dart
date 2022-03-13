import 'dart:convert';

import 'package:dio/dio.dart';

class LoginService {
  // Adicionar ipLocal para teste e depois remover - Trocar "$ipLocal" pelo seu ip
  Dio dio = Dio(BaseOptions(baseUrl: "http://$ipLocal:8000/api/"));

  Future login(String cpf, String password) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};

    Map requestParams = {"cpf": cpf, "password": password};

    String bodyRequest = jsonEncode(requestParams);
    Response? loginResponse;
    try {
      loginResponse = await dio.post(
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
