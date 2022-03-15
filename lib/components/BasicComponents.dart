import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldBC extends StatefulWidget {
  final label;
  final validator;
  final keyboardType;
  final maxLength;
  final format;
  final obscureText;
  final bool notEmpty;
  final int minLength;
  final inputFormatters;
  final onSave;

  const TextFieldBC({
    Key? key,
    this.label,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.format,
    this.obscureText = false,
    this.notEmpty = false,
    this.minLength = 1,
    this.inputFormatters,
    this.onSave,
  }) : super(key: key);

  @override
  _TextFieldBCState createState() => _TextFieldBCState();
}

class _TextFieldBCState extends State<TextFieldBC> {
  final _controller = TextEditingController();

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
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
      validator: widget.validator ??
          (String? value) {
            if (value != null) {
              if (widget.notEmpty && value.isEmpty) {
                return "Campo \"${widget.label}\" deve ser preenchido";
              }

              if (widget.minLength != 1 &&
                  value.characters.length < widget.minLength) {
                return "Tamanho do campo ${widget.label} inválido";
              }

              if (widget.format != null) {
                RegExp regexp = RegExp(widget.format);
                bool itMatches = regexp.hasMatch(value);

                if (!itMatches) {
                  return "Preencha o campo ${widget.label} corretamente";
                }
              }
            }

            return null;
          },
      // ignore: no-empty-block
      onChanged: (_) => setState(() {}),
      controller: _controller,
      onSaved: widget.onSave,
    );
  }
}

class TextFieldDateBC extends StatefulWidget {
  final label;
  final bool notEmpty;
  final minYear;
  final maxYear;
  final onSave;

  const TextFieldDateBC({
    Key? key,
    this.label,
    this.notEmpty = false,
    this.minYear = 1900,
    this.maxYear = 2100,
    this.onSave,
  }) : super(key: key);

  @override
  _TextFieldDateBCState createState() => _TextFieldDateBCState();
}

class _TextFieldDateBCState extends State<TextFieldDateBC> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
      readOnly: true,
      controller: _controller,
      onSaved: widget.onSave,
      validator: (String? value) {
        if (widget.notEmpty && value != null && value.isEmpty) {
          return "Campo \"${widget.label}\" deve ser preenchido";
        }

        return null;
      },
      onTap: () async {
        String formattedDate = "";

        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.input,
          initialDate: DateTime.now(),
          firstDate: DateTime(widget.minYear),
          lastDate: widget.maxYear != DateTime.now().year
              ? DateTime(widget.maxYear)
              : DateTime.now(),
        );

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
