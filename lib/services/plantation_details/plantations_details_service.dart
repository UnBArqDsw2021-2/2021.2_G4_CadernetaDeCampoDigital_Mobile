import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PlantationDetailsService {
  Future getData(String id) async {
    Response getResponse;
    try {
      getResponse = await DioClient.dioClient.fetch('caderneta/$id');
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return getResponse;
  }
}
