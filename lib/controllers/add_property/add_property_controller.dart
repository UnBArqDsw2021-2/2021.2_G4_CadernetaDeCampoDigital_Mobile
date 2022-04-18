import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/services/add_property/add_property_service.dart';
import 'package:dio/dio.dart';

class AddPropertyController {
  AddPropertyService addPropertyService = AddPropertyService();

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
}
