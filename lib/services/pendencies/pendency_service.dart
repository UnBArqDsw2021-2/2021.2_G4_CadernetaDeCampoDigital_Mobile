import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PendencyService {
  Future<Response> getPendencies() async {
    Response response;

    response = await DioClient.dioClient.fetch('plantio/analise/agrotoxico/');

    return response;
  }

  Future<Response> analysePendency(String agrotoxico) async {
    Object analysis = {
      'agrotoxico': agrotoxico,
      'status': 'S',
    };

    Response response;

    response = await DioClient.dioClient
        .patch('plantio/analise/agrotoxico/$agrotoxico/', analysis);

    return response;
  }
}
