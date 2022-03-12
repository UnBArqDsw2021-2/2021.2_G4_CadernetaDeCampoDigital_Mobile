import 'package:flutter/material.dart';

class TextFieldBC extends StatelessWidget {
  final label;
  final onChanged;
  final validator;

  const TextFieldBC({Key? key, this.label, this.onChanged, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
