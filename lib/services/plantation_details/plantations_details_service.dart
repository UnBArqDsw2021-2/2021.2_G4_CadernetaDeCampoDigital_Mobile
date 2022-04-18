import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PlantationDetailsService {
  Future<Response> getData(id) async {
    Response getResponse;

    getResponse = await DioClient.dioClient.fetch('caderneta/$id');

    return getResponse;
  }
}
