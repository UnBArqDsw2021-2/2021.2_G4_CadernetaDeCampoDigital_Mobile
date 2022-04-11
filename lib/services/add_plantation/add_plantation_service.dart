import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class AddPlantationService {
  Future createCultura(String nome) async {
    Map<String, String> object = {"nome": nome};

    Response? culturaResponse;
    try {
      culturaResponse = await DioClient.dioClient.post("cultura/", object);
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return culturaResponse;
  }

  Future addPlantio(Map<String, dynamic> object) async {
    Response? plantioResponse;

    try {
      plantioResponse = await DioClient.dioClient.post("plantio/", object);
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return plantioResponse;
  }

  Future updateEstate(String id) async {
    Response response;

    try {
      response = await DioClient.dioClient.get("propriedade/$id");
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return response;
  }
}
