import 'package:caderneta_campo_digital/services/dio.dart';

class UpdatePlantationService {
  Future<bool> updatePlantation(String plantioId, String estado) async {
    try {
      await DioClient.dioClient.patch('plantio/$plantioId/', {
        'estado': estado,
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
