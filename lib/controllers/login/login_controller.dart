import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/models.dart';
import 'package:caderneta_campo_digital/services/login/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  LoginService loginService = LoginService();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorText = "";
  bool loading = false;

  Future<bool> loginPressed() async {
    String cpf = controllerCpf.text.replaceAll(".", "").replaceAll("-", "");
    Response? response = await loginService.login(cpf, controllerPassword.text);
    print("Recebido!");
    this.loading = false;
    if (response == null) {
      errorText = "Problemas com o servidor!";
      return true;
    } else if (response.statusCode != 200)
      errorText = "Os dados informados estão incorretos!";

    if (response.statusCode == 200) setActualUser(response.data);
    return response.statusCode != 200;
  }

  void setActualUser(dynamic data) {
    bool isProductor;

    if (data['tipo'] == "produtor")
      isProductor = true;
    else
      isProductor = false;

    SharedInfo.actualUser = UserModel(
        name: data["nome"],
        cpf: data["cpf"],
        isProductor: isProductor,
        idUsuario: data["idUsuario"],
        accessToken: data["access"],
        refreshToken: data["refresh"]);
  }
}
