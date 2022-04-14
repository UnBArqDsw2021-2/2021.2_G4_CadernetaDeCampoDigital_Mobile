import 'package:caderneta_campo_digital/models/PesticideAplicationModel.dart';
import 'package:caderneta_campo_digital/services/pendencies/pendency_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PendencyController {
  TextEditingController analysisTextController = TextEditingController();
  PendencyService pendencyService = PendencyService();
  List<PesticideAplicationModel> pesticideAplications = [];

  Future<bool> analysisPressed(String aplicacaoId) async {
    Response response = await pendencyService.analysePendency(
      analysisTextController.text,
      aplicacaoId,
    );

    if (response.statusCode != 200) {
      return false;
    }
    await getPendencies();

    return true;
  }

  String? validateAnalysis(String? value) {
    if (value == null || value.isEmpty) return "Insira o nome do agrotóxico";

    return null;
  }

  Future<bool> getPendencies() async {
    Response response = await pendencyService.getPendencies();

    if (response.data == null) {
      return false;
    }

    setData(response.data);

    return true;
  }

  void setData(data) {
    pesticideAplications = [];

    for (dynamic aplication in data) {
      dynamic map = {
        'id': aplication['idAplicacao'],
        'aplicationDate': aplication['dataAplicacao'],
        'photo': aplication['fotoAgrotoxico'] ?? "",
        'dosage': aplication['fotoAgrotoxico'] ?? 0,
        'cultura': aplication['plantio']['cultura']['nome'],
        'produtor': aplication['produtor']['usuario']['nome'],
      };

      pesticideAplications.add(PesticideAplicationModel.fromMap(map));
    }
  }
}
