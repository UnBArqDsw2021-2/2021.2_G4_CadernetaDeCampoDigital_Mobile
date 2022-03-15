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
            }),
      );

      print(response!.data);

      if (response!.statusCode! > 400) {
        return response;
      } else {
        return null;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        print(error.response!.headers);
        print(error.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(error.requestOptions);
        print(error.message);
      }
      return null;
    }
  }
}
