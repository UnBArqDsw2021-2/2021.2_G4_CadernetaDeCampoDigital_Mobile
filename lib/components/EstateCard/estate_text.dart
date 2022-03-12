import 'package:flutter/material.dart';

class EstateText extends StatefulWidget {
  final String text;
  const EstateText({Key? key, required this.text}) : super(key: key);

  @override
  State<EstateText> createState() => _EstateTextState();
}

class _EstateTextState extends State<EstateText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Roboto-Regular',
        ));
  }
}
