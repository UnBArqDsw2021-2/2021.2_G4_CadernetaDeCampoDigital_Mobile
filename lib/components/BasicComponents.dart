import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBC extends StatelessWidget {
  final label;

  const TextFieldBC({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
