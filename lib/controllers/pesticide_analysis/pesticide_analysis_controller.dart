import 'package:flutter/cupertino.dart';

class PesticideAnalysisController {
  TextEditingController analysisTextController = TextEditingController();

  Future<bool> analysisPressed() async {
    return true;
  }

  String? validateAnalysis(String? value) {
    if (value == null || value.isEmpty) return "Insira a análise";

    return null;
  }
}
