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
  List<CulturaModel> culturas = [];
  String? idSelectedCultura = "676caa65-e677-475c-a3b7-af6c85e1bb4e";

  String? validatePlantationName(String? value) {
    if (value == null || value.isEmpty) return "Insira o nome da plantação";

    return null;
  }

  getCulturas() async {
    if (culturas.isEmpty) return;
    Response? responseCultura = await addPlantationService.getCulturas();
    if (responseCultura != null) {
      List data = responseCultura.data;
      culturas = [];
      for (var element in data) {
        culturas.add(CulturaModel(element["idCultura"], element["nome"]));
      }
    }
  }

  Future<bool> sendNewPlantationRequest(
    String plantationName,
    TalhaoModel talhao,
    String date,
  ) async {
    Map<String, dynamic> object = {
      "cultura": idSelectedCultura,
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
