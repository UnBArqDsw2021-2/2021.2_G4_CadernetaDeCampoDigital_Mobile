import 'package:caderneta_campo_digital/services/update_property/update_property_service.dart';
import 'package:dio/dio.dart';

class UpdatePropertyController {
  UpdatePropertyService updatePropertyService = UpdatePropertyService();

  Future sendForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await updatePropertyService.updateProperty(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }
}
