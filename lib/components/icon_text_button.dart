import 'package:flutter/material.dart';
import 'dart:math';

class IconTextButton extends StatelessWidget {
  final String label;
  final Size size;
  final Icon icon;
  final num marginSize;
  final Color borderColor;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? splashColor;
  final onPressed;

  const IconTextButton(
    this.label,
    this.size,
    this.icon,
    this.marginSize, {
    Key? key,
    this.textColor = const Color(0XFF03045E),
    this.fontSize = 0,
    required this.borderColor,
    this.backgroundColor = Colors.white,
    required this.onPressed,
    this.splashColor = const Color(0XFF00B4D8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: min(size.width * marginSize, size.height * marginSize),
      ),
      child: MaterialButton(
        // ignore: no-empty-block
        onPressed: onPressed,
        splashColor: splashColor,
        highlightColor: Colors.transparent,
        child: Container(
          height: max(size.height * 0.07, size.width * 0.07),
          width: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: borderColor, width: 2.0),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: icon,
              ),
              Container(
                height: size.height * 0.043,
                width: 1,
                color: textColor,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: min(size.width * 0.037, size.height * 0.037),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize != 0
                        ? fontSize
                        : min(size.width * 0.06, size.height * 0.06),
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
