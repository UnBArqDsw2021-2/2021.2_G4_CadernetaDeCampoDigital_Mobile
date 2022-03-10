import 'package:caderneta_campo_digital/components/BasicComponents.dart';
import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProducerRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProducerRegisterState();
}

class _ProducerRegisterState extends State<ProducerRegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/white_stack_background_upper.svg',
              width: size.width,
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 90),
              child: Text(
                "CADASTRO",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              height: size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset('assets/logo.svg'),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFieldBC(label: "CPF"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFieldBC(label: "Senha"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFieldBC(label: "Confirmar Senha"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          TextBlueButton(
                            label: "Cadastrar",
                            onPressed: () {
                              print("Cadastrei");
                            },
                            margin: EdgeInsets.symmetric(vertical: 10),
                          ),
                          UnderlineButton(
                            label: "Cancelar",
                            onPressed: () {
                              print('Cancelei');
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SvgPicture.asset(
                          'assets/white_stack_background_lower.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
