import 'dart:async';
import 'package:flutter/material.dart';
import 'package:caderneta_campo_digital/pages/login/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    // ignore: no-empty-block
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _splashScreen(context);
  }

  Widget _splashScreen(context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 129, 182, 34),
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color(0XFF0077B6),
                Color(0XFF00B4D8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Image.asset("assets/logo_branca.png"),
        ),
      ),
    );
  }
}
