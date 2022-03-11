import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuário',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: MaterialButton(
                      onPressed: () {},
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
                    margin: EdgeInsets.symmetric(vertical: 30),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      "assets/login/Detail2.svg",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
