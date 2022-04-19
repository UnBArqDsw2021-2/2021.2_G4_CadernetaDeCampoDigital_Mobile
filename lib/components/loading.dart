import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Center(
            child: CircularProgressIndicator(
              color: MyColors().blue,
            ),
          ),
        ),
        Center(
          child: Text(
            'Carregando',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors().blue,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
