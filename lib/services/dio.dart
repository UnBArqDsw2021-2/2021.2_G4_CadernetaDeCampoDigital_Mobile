import 'dart:convert';

import 'package:dio/dio.dart';

class DioClient {
  var http = Dio(BaseOptions(
      baseUrl: 'http://0.0.0.0:8000/',
      connectTimeout: 5000,
      receiveTimeout: 3000));

  Response? response;

  Future post(String url, object) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};
    String bodyRequest = jsonEncode(object);
    try {
      response = await http.post(
        url,
        data: bodyRequest,
        options: Options(
            headers: header,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );
      print(response!.data);
      return response;
    } on DioError catch (error) {
      print(error);
      print(response?.statusCode);
    }
  }
}
