import 'package:caderneta_campo_digital/services/agrotoxic/agrotoxic_service.dart';
import 'package:dio/dio.dart';

class AgrotoxicController {
  AgrotoxicService agrotoxicService = AgrotoxicService();

  Future sendAgrotoxicTypeForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await agrotoxicService.sendAgrotoxicTypeRegister(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future sendAgrotoxicForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await agrotoxicService.sendAgrotoxicRegister(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future sendAgrotoxicApplicationForm(Map<String, dynamic> formsValue) async {
    try {
      Response response =
          await agrotoxicService.sendAgrotoxicApplication(formsValue);

      if (response.statusCode! >= 400) {
        return null;
      }

      return response;
    } catch (e) {
      return null;
    }
  }
}
