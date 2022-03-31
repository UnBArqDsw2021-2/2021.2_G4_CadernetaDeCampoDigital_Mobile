import 'package:caderneta_campo_digital/services/register/register_service.dart';
import 'package:dio/dio.dart';

class RegisterController {
  RegisterService registerService = RegisterService();

  Future sendForm(String type, Map<String, dynamic> formsValue) async {
    if (type == 'Producer') {
      try {
        Response response =
            await registerService.sendProducerRegister(formsValue);

        if (response.statusCode! >= 400) {
          return null;
        }

        return response;
      } catch (e) {
        return null;
      }
    } else if (type == 'Technician') {
      try {
        Response response =
            await registerService.sendTechnicianRegister(formsValue);

        if (response.statusCode! >= 400) {
          return null;
        }

        return response;
      } catch (e) {
        return null;
      }
    } else {
      throw Exception("invalid type on register forms!");
    }
  }
}
