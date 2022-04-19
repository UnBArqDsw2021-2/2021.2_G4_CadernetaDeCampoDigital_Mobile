import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:flutter/material.dart';

class TextBlueButton extends StatelessWidget {
  final label;
  final onPressed;
  final margin;
  final width;
  final height;

  const TextBlueButton({
    Key? key,
    this.label,
    this.onPressed,
    this.margin,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? 200,
      height: height ?? 60,
      child: TextButton(
        key: Key('text_blue_button'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return MyColors().blue.withOpacity(0.7);

              return MyColors().blue.withOpacity(1.0);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
