import 'package:caderneta_campo_digital/services/update_plantation/update_plantation_service.dart';

class UpdatePlantationController {
  UpdatePlantationService updatePlantationService = UpdatePlantationService();

  dynamic marcarComoColhido(String plantioId) async {
    bool response =
        await updatePlantationService.updatePlantation(plantioId, "Finalizado");

    return response;
  }
}
