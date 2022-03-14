import 'package:caderneta_campo_digital/global/global.dart';
import 'package:flutter/material.dart';

// CLASSE CRIADA APENAS PARA REALIZAÇÃO DO LOGIN

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String texto;
    if (SharedInfo.actualUser.isProductor)
      texto = "PRODUTOR";
    else
      texto = "TÉCNICO";
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("HOME $texto"),
        ),
      ),
    );
  }
}
