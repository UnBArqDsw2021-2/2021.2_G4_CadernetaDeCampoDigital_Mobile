import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/user.dart';
import 'package:caderneta_campo_digital/services/login/login_service.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  LoginService loginService = LoginService();
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorText = "";
  bool loading = false;

  Future<bool> loginPressed(valueCpf, valuePassword) async {
    String cpf = valueCpf.replaceAll(".", "").replaceAll("-", "");
    var response = await loginService.login(cpf, valuePassword);
    loading = false;

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

    data['tipo'] == "produtor" ? isProductor = true : isProductor = false;

    SharedInfo.actualUser = UserModel(
      name: data["nome"],
      cpf: data["cpf"],
      isProductor: isProductor,
      idUsuario: data["idUsuario"],
      accessToken: data["access"],
      refreshToken: data["refresh"],
    );
  }

  String? validateCpf(String? value) {
    if (value == null || value.isEmpty)
      return "Insira o seu CPF";
    else if (value.length != 14) return "CPF inválido";

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Insira a sua senha";

    return null;
  }
}
