import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class UnderlineButton extends StatelessWidget {
  final label;
  final onPressed;

  const UnderlineButton({Key? key, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            fontSize: 20,
            color: MyColors().blueButton,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
