import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future login(String cpf, String password) async {
    Map<String, dynamic> bodyRequest = {'cpf': cpf, 'password': password};

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
