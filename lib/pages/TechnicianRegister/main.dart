import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/components/BasicComponents.dart';
import 'package:caderneta_campo_digital/components/TextBlueButton/main.dart';
import 'package:caderneta_campo_digital/components/UnderlineButton/main.dart';

class TechnicianRegisterPage extends StatefulWidget {
  const TechnicianRegisterPage({Key? key}) : super(key: key);

  @override
  _TechnicianRegisterPageState createState() => _TechnicianRegisterPageState();
}

class _TechnicianRegisterPageState extends State<TechnicianRegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(children: [
        SvgPicture.asset("assets/white_stack_background_upper.svg",
            width: size.width),
        Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 90),
                child: Text("CADASTRO",
                    style: TextStyle(
                        fontSize: 36,
                        color: MyColors().white,
                        fontFamily: 'Roboto')))),
      ]),
      SvgPicture.asset("assets/logo.svg"),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            child: Column(
              children: [
                TextFieldBC(label: "CPF"),
                SizedBox(height: 20),
                TextFieldBC(label: "Data de Nascimento"),
                SizedBox(height: 20),
                TextFieldBC(label: "Telefone"),
                SizedBox(height: 20),
                TextFieldBC(label: "Nome"),
                SizedBox(height: 20),
                TextFieldBC(label: "N° do CREA"),
                SizedBox(height: 20),
                TextFieldBC(label: "Formação"),
                SizedBox(height: 20),
                TextFieldBC(label: "E-mail"),
                SizedBox(height: 20),
                TextFieldBC(label: "Senha"),
                SizedBox(height: 20),
                TextFieldBC(label: "Confirmar Senha"),
                TextBlueButton(
                    label: "Cadastrar",
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 20)),
              ],
            ),
          )),
      Stack(children: [
        Center(child: UnderlineButton(label: "Cancelar")),
        Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset("assets/white_stack_background_lower.svg"))
      ])
    ])));
  }
}
