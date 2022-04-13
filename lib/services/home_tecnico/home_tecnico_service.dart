import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class HomeTecnicoService {
  Future<Response> getData() async {

    Response getResponse;

    getResponse = await DioClient.dioClient.fetch('propriedade/');

    return getResponse;
  }
}
