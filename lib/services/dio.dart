import 'package:dio/dio.dart';

import '../global/global.dart';

class DioClient {
  static final dioClient = DioClient._();
  var http = Dio(
    BaseOptions(
      baseUrl: 'https://ccd-backend.herokuapp.com/api/',
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  );

  Future post(String url, object) async {
    Map<String, dynamic> header = {"Content-Type": "multipart/form-data"};
    var formData = FormData.fromMap(object);

    try {
      Response response = await http.post(
        url,
        data: formData,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

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

      // print(response);

      return response;
    } on DioError catch (error) {
      // ignore: avoid_print
      print("requisição: " + error.toString());
      if (error.response != null) {
        return error;
      }
    }
  }

  Future fetch(String url) async {
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + SharedInfo.actualUser.accessToken,
    };

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
      if (error.response != null) {
        return error;
      }
    }
  }

  Future patch(String url, object) async {
    Map<String, dynamic> header = {"Content-Type": "application/json"};
    var formData = FormData.fromMap(object);

    try {
      Response response = await http.patch(
        url,
        data: formData,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error;
      }
    }
  }

  DioClient._();
}
