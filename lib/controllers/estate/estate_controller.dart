import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/services/estate/estate_service.dart';

class EstateController {
  EstateService estateService = EstateService();

  dynamic createPlot(Propriedade estate) async {
    bool response = await estateService.createPlot({
      'propriedade': estate.id,
      'numero': estate.talhoes.length + 1,
    });

    return response;
  }
}
