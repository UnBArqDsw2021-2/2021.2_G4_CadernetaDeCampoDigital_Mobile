import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class HomeProdutorService {
  Future<Response> getData() async {

    Response getResponse;

    getResponse = await DioClient.dioClient.fetch('propriedade/');

    print(getResponse.data);

    return getResponse;
  }
}
