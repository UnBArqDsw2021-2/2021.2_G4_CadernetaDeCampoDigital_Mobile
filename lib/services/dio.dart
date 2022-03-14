import 'package:dio/dio.dart';

class DioClient {
  var http = Dio();

  final baseUrl = 'http://127.0.0.1:8000/'; // Ajustar para um .env

  Future post(String url, object) async {
    try {
      Response response = await http.post(this.baseUrl + url, data: object);
      return response;
    } catch (error) {
      print(error);
    }
  }
}
