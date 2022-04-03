import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/services/add_property/add_property_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddPropertyController {
  AddPropertyService addPropertyService = AddPropertyService();

  final List<String> _ufs = [
    'RO',
    'AC',
    'AM',
    'RR',
    'PA',
    'AP',
    'TO',
    'MA',
    'PI',
    'CE',
    'RN',
    'PB',
    'PE',
    'AL',
    'SE',
    'BA',
    'MG',
    'ES',
    'RJ',
    'SP',
    'PR',
    'SC',
    'RS',
    'MS',
    'MT',
    'GO',
    'DF',
  ];

  Future sendForm(Map<String, dynamic> formsValue) async {
    try {
      formsValue['produtor'] = SharedInfo.actualUser.cpf;

      Response response = await addPropertyService.createProperty(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  dynamic getUFsList() {
    return _ufs.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
