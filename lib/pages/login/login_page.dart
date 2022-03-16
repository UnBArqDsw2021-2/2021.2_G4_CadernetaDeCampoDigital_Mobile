import 'package:caderneta_campo_digital/controllers/login/login_controller.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;
  bool failedLogin = false;
  LoginController loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              SvgPicture.asset("assets/login/Detail1.svg", width: size.width),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 85),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                    Image.asset("assets/logo.png"),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
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
                                MaskTextInputFormatter(mask: "###.###.###-##")
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
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
                              )
                            ],
                          )
                        : Container(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            loginController.loading = true;
                            setState(() {});
                            failedLogin = await loginController.loginPressed();
                            setState(() {});
                            if (!failedLogin) if (!failedLogin)
                              navigateToHome();
                          }
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0XFF00B4D8),
                          ),
                          child: Center(
                              child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: MaterialButton(
                        onPressed: () {},
                        splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            "Cadastro",
                            style: TextStyle(
                                color: Color(0XFF00B4D8),
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: SvgPicture.asset(
                  "assets/login/Detail2.svg",
                ),
              ),
              loginController.loading
                  ? Center(
                      child:
                          CircularProgressIndicator(color: Color(0XFF00B4D8)),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      if (SharedInfo.actualUser.isProductor)
        return Home();
      else
        return Home();
    }));
  }
}
