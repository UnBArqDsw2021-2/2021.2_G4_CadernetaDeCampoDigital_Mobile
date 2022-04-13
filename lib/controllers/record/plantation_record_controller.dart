import 'package:caderneta_campo_digital/models/CulturaModel.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:caderneta_campo_digital/pages/record/components/record_card.dart';
import 'package:caderneta_campo_digital/services/record/plantation_record_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantationRecordController {
  PlantationRecordService recordService = PlantationRecordService();
  List<Widget> historyList = [];
  bool loading = false;
  String failMessage = "";

  Future<bool> loadHistory(String idPropriedade) async {
    Response? response = await recordService.getHistoric(idPropriedade);

    if (response == null) {
      failMessage =
          "Não foi possível acessar o histórico! Tente novamente mais tarde.";

      return true;
    } else if (response.statusCode != 200) {
      failMessage = "Problema com o servidor! Tente novamente mais tarde";

      return true;
    }

    List responseList = response.data;

    historyList = [];

    for (var element in responseList) {
      if (element["estado"] == "Finalizado") {
        PlantioModel plantio = PlantioModel(
          element["idPlantio"],
          CulturaModel(
            element["cultura"]["idCultura"],
            element["cultura"]["nome"],
          ),
          element["dataPlantio"],
          element["estado"],
          "",
          false,
        );
        historyList.add(RecordCard(plantio: plantio));
      }
    }

    if (historyList.isEmpty) failMessage = "Não existe histórico ainda!";

    return false;
  }

  static String convertDataFromServer(String date) {
    var dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat("dd/MM/yyyy");

    return formatter.format(dateTime);
  }
}
