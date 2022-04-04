import 'package:flutter/cupertino.dart';

class PesticideAnalysisController {
  TextEditingController analysisTextController = TextEditingController();

  Future<bool> analysisPressed() async {
    //Futuramente realizar requisição
    return true;
  }

  String? validateAnalysis(String? value) {
    if (value == null || value.isEmpty) return "Insira o nome do agrotóxico";

    return null;
  }
}
