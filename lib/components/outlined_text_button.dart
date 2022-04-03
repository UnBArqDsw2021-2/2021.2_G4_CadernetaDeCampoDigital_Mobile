import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class OutlinedTextButton extends StatelessWidget {
  final label;
  final onPressed;
  final margin;
  final width;
  final heigth;

  const OutlinedTextButton({
    Key? key,
    this.label,
    this.onPressed,
    this.margin,
    this.width,
    this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? 200,
      height: heigth ?? 60,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: MyColors().blueButton,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: BorderSide(
            width: 5.0,
            color: MyColors().blueButton,
          ),
        ),
      ),
    );
  }
}
