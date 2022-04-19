import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class EstateService {
  dynamic createPlot(Map<String, dynamic> body) async {
    try {
      Response response = await DioClient.dioClient.post('talhao/', {
        'idPropriedade': body['propriedade'],
        'numero': body['numero'],
      });

      debugPrint('$response');

      return true;
    } catch (e) {
      return false;
    }
  }
}
