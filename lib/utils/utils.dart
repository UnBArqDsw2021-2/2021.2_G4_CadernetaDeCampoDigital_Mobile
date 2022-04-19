import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Utils {
  static final TextStyle estateTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Roboto-Regular',
  );

  final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskData = MaskTextInputFormatter(
    mask: "##/##/####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskTelefone = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskCrea = MaskTextInputFormatter(
    mask: "#########-#",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskCep = MaskTextInputFormatter(
    mask: "##.###-###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final maskHectares = MaskTextInputFormatter(
    mask: "####.#",
    filter: {"#": RegExp(r'[0-9]')},
  );

  String? clearMask(String? string) {
    String newString = string!.replaceAll(RegExp(r'[\s\.\-\(\)]+'), '');

    return newString;
  }

  String? clearData(String? data) {
    var newData = data!.split("/");

    return (newData.reversed).join("-");
  }

  String formatData(String? data) {
    initializeDateFormatting();

    return DateFormat('dd/MM/yyy', 'pt-BR').format(DateTime.parse(data!));
  }

  List<String> ufs = [
    'AC',
    'AL',
    'AM',
    'AP',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MG',
    'MS',
    'MT',
    'PA',
    'PB',
    'PE',
    'PI',
    'PR',
    'RJ',
    'RN',
    'RO',
    'RR',
    'RS',
    'SC',
    'SE',
    'SP',
    'TO',
  ];

  dynamic getUFsList() {
    return Utils().ufs.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Utils();
}
