import 'package:caderneta_campo_digital/models/PesticideAplicationModel.dart';
import 'package:caderneta_campo_digital/models/PesticideModel.dart';
import 'package:caderneta_campo_digital/services/pendencies/pendency_service.dart';
import 'package:caderneta_campo_digital/services/pesticide/pesticide_service.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PendencyController {
  PendencyService pendencyService = PendencyService();
  PesticideService pesticideService = PesticideService();
  List<PesticideAplicationModel> pesticideAplications = [];

  Future<bool> analysisPressed(String aplicacaoId, String pesticideId) async {
    Response response = await pendencyService.analysePendency(
      pesticideId,
      aplicacaoId,
    );

    if (response.statusCode != 200) {
      return false;
    }

    return true;
  }

  String? validateAnalysis(String? value) {
    if (value == null || value.isEmpty) return "Insira o nome do agrotóxico";

    return null;
  }

  Future<List<Pesticide>> getPesticides() async {
    return await PesticideService.getPesticides();
  }

  Future<bool> getPendencies() async {
    Response response = await pendencyService.getPendencies();

    if (response.data == null) {
      return false;
    }

    setPendencies(response.data);

    return true;
  }

  void setPendencies(data) {
    pesticideAplications = [];

    for (dynamic aplication in data) {
      if (aplication['estadoAnalise'] == "P") {
        dynamic map = {
          'id': aplication['idAplicacao'],
          'aplicationDate': Utils().formatData(aplication['dataAplicacao']),
          'pesticide': aplication['agrotoxico'] ?? "",
          'photo': aplication['fotoAgrotoxico'] ?? "",
          'dosage': aplication['dosagemAplicacao'] ?? "0",
          'cultura': aplication['plantio']['cultura']['nome'],
          'produtor': aplication['produtor']['usuario']['nome'],
        };

        pesticideAplications.add(PesticideAplicationModel.fromMap(map));
      }
    }
  }

  dynamic getPesticideList(List<Pesticide> pesticides) {
    return pesticides.map<DropdownMenuItem<String>>((Pesticide value) {
      return DropdownMenuItem<String>(
        value: value.id,
        child: Text(value.name),
      );
    }).toList();
  }
}
