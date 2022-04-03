import 'dart:convert';
import 'package:dio/dio.dart';

class DioClient {
  static final dioClient = DioClient._();
  var http = Dio(
    BaseOptions(
      baseUrl: 'https://ccd-backend.herokuapp.com/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future post(String url, object) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};
    String bodyRequest = jsonEncode(object);

    try {
      Response response = await http.post(
        url,
        data: bodyRequest,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      // print(response);

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error;
      }
    }
  }

  Future get(String url) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};

    try {
      Response response = await http.get(
        url,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      return response;
    } on DioError catch (error) {
      // ignore: avoid_print
      print("requisição: " + error.toString());
      if (error.response != null) {
        return error;
      }
    }
  }

  DioClient._();
}
