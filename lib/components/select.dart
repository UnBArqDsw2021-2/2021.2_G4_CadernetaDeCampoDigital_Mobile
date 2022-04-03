import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  final List<String> options;

  const Select({Key? key, required this.options}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String _selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        'choose one',
      ),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;
        });
      },
      onSaved: (value) {
        setState(() {
          _selectedValue = value!;
        });
      },
      validator: (value) {
        return value!.isEmpty ? "Campo deve ser preenchido" : null;
      },
      items: widget.options.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }
}
