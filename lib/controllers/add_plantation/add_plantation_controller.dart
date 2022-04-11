import 'package:caderneta_campo_digital/models/CulturaModel.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/services/add_plantation/add_plantation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AddPlantationController {
  final plantationNameController = TextEditingController();
  AddPlantationService addPlantationService = AddPlantationService();
  String errorText = "Problemas com o servidor!";
  bool anyProblem = false;
  bool loadingRequest = false;

  String? validatePlantationName(String? value) {
    if (value == null || value.isEmpty) return "Insira o nome da plantação";

    return null;
  }

  Future<bool> sendNewPlantationRequest(
    String plantationName,
    TalhaoModel talhao,
    String date,
  ) async {
    // Adicionar lógica para criar cultura só quando não tiver outra igual
    Response? responseCultura =
        await addPlantationService.createCultura(plantationName);

    if (responseCultura != null) {
      if (responseCultura.statusCode == 400) {
        anyProblem = true;
        errorText = "Cultura já existente na base de dados";

        return false;
      }
      Map<String, dynamic> object = {
        // "cultura": responseCultura.data["idCultura"],
        "cultura": "c2e88db3-229f-4730-9605-e6ddacb0a52a",
        "talhao": talhao.id,
        "dataPlantio": date,
        "estado": "Plantado",
      };

      var responsePlantio = await addPlantationService.addPlantio(object);

      if (responsePlantio.statusCode == 400) {
        anyProblem = true;
        errorText = "Problema ao adicionar plantio!";

        return false;
      }

      return true;
    } else {
      anyProblem = true;
      errorText = "Problema ao adicionar nova cultura";

      return false;
    }
  }

  List<PlantioModel> getPlantios(array) {
    List<PlantioModel> plantios = [];

    for (dynamic plantio in array) {
      plantios.add(
        PlantioModel(
          plantio['idPlantio'],
          CulturaModel(
            plantio['cultura']['idCultura'],
            plantio['cultura']['nome'],
          ),
          plantio['dataPlantio'],
          plantio['estado'],
          '',
          false,
        ),
      );
    }

    return plantios;
  }

  List<TalhaoModel> getTalhoes(array) {
    List<TalhaoModel> talhoes = [];

    for (dynamic talhao in array) {
      talhoes.add(
        TalhaoModel(
          talhao['idTalhao'],
          talhao['idPropriedade'],
          talhao['numero'],
          getPlantios(talhao['plantio']),
        ),
      );
    }

    return talhoes;
  }

  Future<Propriedade> updateEstateInfo(Propriedade estate) async {
    Response? responseEstate =
        await addPlantationService.updateEstate(estate.id);

    if (responseEstate != null) {
      List<TalhaoModel> talhoes = getTalhoes(responseEstate.data["talhao"]);
      estate.talhoes = talhoes;

      return estate;
    }

    return estate;
  }
}
