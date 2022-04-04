// ignore_for_file: sized_box_for_whitespace

import 'package:caderneta_campo_digital/components/base_authentication.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/controllers/login/login_controller.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:caderneta_campo_digital/pages/home_tecnico/home_tecnico.dart';
import 'package:flutter/material.dart';
import 'package:caderneta_campo_digital/pages/select_account/select_account.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:caderneta_campo_digital/components/underline_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;
  bool failedLogin = false;
  String? _cpf;
  String? _senha;
  LoginController loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseAuthentication(
      label: "LOGIN",
      isLoading: loginController.loading,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldBC(
              key: Key("cpfField"),
              label: "CPF",
              validator: (value) => loginController.validateCpf(value),
              keyboardType: TextInputType.number,
              inputFormatters: [Utils().maskCpf],
              onSave: (String? value) {
                if (value != null) {
                  _cpf = value;
                }
              },
            ),
            SizedBox(height: 20),
            TextFieldBC(
              key: Key("passwordField"),
              password: true,
              validator: (value) => loginController.validatePassword(value),
              label: "Senha",
              onSave: (String? value) {
                if (value != null) {
                  _senha = value;
                }
              },
            ),
            SizedBox(height: 20),
            failedLogin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cancel_outlined,
                        size: 14,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          loginController.errorText,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                : Container(),
            TextBlueButton(
              key: Key("Entrar_Button"),
              label: "Entrar",
              margin: EdgeInsets.symmetric(vertical: size.height * 0.025),
              onPressed: buttonPressed,
            ),
            UnderlineButton(
              label: "Cadastro",
              // ignore: no-empty-block
              onPressed: () {
                navigateToSelectAccount();
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SharedInfo.actualUser.isProductor
          ? HomeProdutorPage()
          : HomeTecnicoPage();
    }));
  }

  void navigateToSelectAccount() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SelectAccountPage();
    }));
  }

  void buttonPressed() async {
    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
      setState(() {
        loginController.loading = true;
      });
      failedLogin = await loginController.loginPressed(_cpf, _senha);
      // ignore: no-empty-block
      setState(() {});
      if (!failedLogin) navigateToHome();
    } else {
      setState(() {
        failedLogin = false;
      });
    }
  }
}
