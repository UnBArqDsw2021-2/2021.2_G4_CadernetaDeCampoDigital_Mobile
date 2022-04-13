import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PlantationRecordService {
  Future getHistoric(
    String idPropriedade,
    bool isPlotHistoric,
    String? plotId,
  ) async {
    Response? plantationHistory;

    String url =
        isPlotHistoric ? "" : "propriedade/$idPropriedade/historico/plantio";

    try {
      plantationHistory = await DioClient.dioClient.get(url);
    } on DioError catch (exception) {
      if (exception.response != null) {
        return exception;
      }

      return null;
    }

    return plantationHistory;
  }
}
