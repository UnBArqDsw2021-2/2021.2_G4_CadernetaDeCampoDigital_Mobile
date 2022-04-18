import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class UpdateProfileService {
  Future<Response> updateProfile(Map<String, dynamic> infoUser) async {
    String id = infoUser['id'];

    Response response = await DioClient.dioClient.patch('usuario/$id/', {
      'cpf': infoUser['cpf'],
      'nome': infoUser['nome'],
      'password': infoUser['password'],
    });

    return response;
  }
}
