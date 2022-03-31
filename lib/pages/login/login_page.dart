// ignore_for_file: sized_box_for_whitespace

import 'package:caderneta_campo_digital/components/base_authentication.dart';
import 'package:caderneta_campo_digital/components/basic_components.dart';
import 'package:caderneta_campo_digital/components/text_blue_button.dart';
import 'package:caderneta_campo_digital/controllers/login/login_controller.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:caderneta_campo_digital/pages/home_tecnico/home_tecnico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
                      Image.asset("assets/logo.png"),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.025,
                                vertical: size.width * 0.01,
                              ),
                              child: TextFormField(
                                key: Key("cpfField"),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CPF',
                                ),
                                validator: (value) =>
                                    loginController.validateCpf(value),
                                controller: loginController.controllerCpf,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(14),
                                  MaskTextInputFormatter(
                                    mask: "###.###.###-##",
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.025,
                                vertical: size.width * 0.01,
                              ),
                              child: TextFormField(
                                key: Key("passwordField"),
                                obscureText: obscurePassword,
                                validator: (value) =>
                                    loginController.validatePassword(value),
                                controller: loginController.controllerPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.blue.withOpacity(0.2),
                                  ),
                                  labelText: 'Senha',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.025),
                        child: MaterialButton(
                          onPressed: buttonPressed,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            height: size.height * 0.07,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0XFF00B4D8),
                            ),
                            child: Center(
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.01),
                        child: MaterialButton(
                          // ignore: no-empty-block
                          onPressed: () {
                            navigateToSelectAccount();
                          },
                          splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: size.height * 0.07,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "Cadastro",
                                style: TextStyle(
                                  color: Color(0XFF00B4D8),
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
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
