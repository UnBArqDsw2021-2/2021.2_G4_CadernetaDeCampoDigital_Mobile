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

  Future sendForm() async {
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
}
