import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PlantationRecordService {
  Future getHistoric(String idPropriedade) async {
    Response? plantationHistory;

    try {
      plantationHistory = await DioClient.dioClient
          .get("propriedade/$idPropriedade/historico/plantio");
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return plantationHistory;
  }
}
