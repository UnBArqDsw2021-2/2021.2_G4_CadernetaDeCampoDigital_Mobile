import 'package:dio/dio.dart';

class Utils {
  static Dio dio = Dio(BaseOptions(baseUrl: "https://ccd-backend.herokuapp.com/api/"));
  Utils();
}
