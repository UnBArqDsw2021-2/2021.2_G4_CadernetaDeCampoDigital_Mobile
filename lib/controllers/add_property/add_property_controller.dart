import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/AddPropertyModel.dart';
import 'package:caderneta_campo_digital/services/add_property/add_property_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum AddPropertyState { loading, success, failed }

class AddPropertyController extends ChangeNotifier {
  final AddPropertyService _addPropertyService;
  var state;
  var addProperty = AddPropertyModel('', '', '', '', '', '', '', '');

  AddPropertyController(this._addPropertyService);

  final List<String> _ufs = [
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

  Future submit() async {
    state = AddPropertyState.loading;
    notifyListeners();

    try {
      Map<String, dynamic> addPropertyMap = addProperty.toMap();
      addPropertyMap['produtor'] = SharedInfo.actualUser.cpf;

      Response response =
          await _addPropertyService.createProperty(addPropertyMap);

      if (response.statusCode! >= 400) {
        throw ErrorHint('Ocorreu um erro ao criar propriedade');
      }

      state = AddPropertyState.success;
      notifyListeners();

      return response;
    } catch (e) {
      state = AddPropertyState.failed;
      notifyListeners();
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
