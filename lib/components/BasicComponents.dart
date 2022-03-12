import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldBC extends StatefulWidget {
  final label;
  final onChanged;
  final validator;
  final keyboardType;
  final maxLength;
  final obscureText;
  final bool notEmpty;
  final int minLength;

  const TextFieldBC({
    Key? key,
    this.label,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.notEmpty = false,
    this.minLength = 0,
  }) : super(key: key);

  @override
  _TextFieldBCState createState() => _TextFieldBCState();
}

class _TextFieldBCState extends State<TextFieldBC> {
  final _controller = TextEditingController();

  String? get _errorText {
    final text = _controller.value.text;

    if (widget.notEmpty && text.isEmpty) {
      return "Campo deve ser preenchido";
    }

    if (widget.minLength != 0 && text.length < widget.minLength) {
      return "Tamanho mínimo de ${widget.minLength} caracteres";
    }

    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
        errorText: _errorText,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged ? widget.onChanged : (_) => setState(() {}),
      controller: _controller,
    );
  }
}

class TextFieldDateBC extends StatefulWidget {
  final label;
  final bool notEmpty;
  final minYear;
  final maxYear;

  const TextFieldDateBC({
    Key? key,
    this.label,
    this.notEmpty = false,
    this.minYear = 1900,
    this.maxYear = 2100,
  }) : super(key: key);

  @override
  _TextFieldDateBCState createState() => _TextFieldDateBCState();
}

class _TextFieldDateBCState extends State<TextFieldDateBC> {
  final _controller = TextEditingController();

  String? get _errorText {
    final text = _controller.value.text;

    if (widget.notEmpty && text.isEmpty) {
      return "Campo deve ser preenchido";
    }

    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
        errorText: _errorText,
      ),
      readOnly: true,
      controller: _controller,
      onTap: () async {
        String formattedDate = "";

        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(widget.minYear),
            lastDate: widget.maxYear != DateTime.now().year
                ? DateTime(widget.maxYear)
                : DateTime.now());

        if (pickedDate != null) {
          formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        }

        setState(() {
          _controller.text = formattedDate;
        });
      },
    );
  }
}
