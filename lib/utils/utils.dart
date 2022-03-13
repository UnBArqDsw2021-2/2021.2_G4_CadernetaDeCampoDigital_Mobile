import 'package:dio/dio.dart';

class Utils {
  static Dio dio = Dio(BaseOptions(baseUrl: "http://ipLocal:8000/api/"));
  Utils();
}
