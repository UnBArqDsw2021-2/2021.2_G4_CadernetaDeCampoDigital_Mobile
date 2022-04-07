import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/UserModel.dart';
import 'package:flutter/material.dart';
import '../../pages/login/login_page.dart';

class ProfileController {
  /*ProfileService profileService = ProfileService();
  String errorText = "";
  bool loading = false;

  Future<bool> deleteProfile(BuildContext context) async {
    var response = await profileService.deleteProfile();
    loading = false;

    if (response == null) {
      errorText = "Problemas com o servidor!";

      return true;
    } else if (response.statusCode != 200)
      errorText = "Por algum motivo não foi possivel deletar o usuário";

    if (response.statusCode == 200) logout(context);

    return response.statusCode != 200;
  } */

  void logout(BuildContext context) {
    SharedInfo.actualUser = UserModel(
      name: "",
      cpf: "",
      isProductor: false,
      idUsuario: "",
      accessToken: "",
      refreshToken: "",
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => route.isCurrent,
    );
  }
}
