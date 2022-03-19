import 'dart:convert';

import 'package:dio/dio.dart';

class DioClient {
  var http = Dio(
    BaseOptions(
      baseUrl: 'http://0.0.0.0:8000/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

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
          },
        ),
      );

      return response!.statusCode! > 400 ? response : null;
    } on DioError catch (error) {
      if (error.response != null) {
        return error;
      }
    }
  }
}
