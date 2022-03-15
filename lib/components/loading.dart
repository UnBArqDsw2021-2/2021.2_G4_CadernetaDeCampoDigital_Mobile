import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Center(
            child: CircularProgressIndicator(
              color: MyColors().blueButton,
            ),
          ),
        ),
        Center(
          child: Text(
            'Aguarde enquanto realizamos seu cadastro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors().blueButton,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ],
    ));
  }
}