import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';
import '../../global/global.dart';

class WithoutTechnicianService {
  Future<Response> getData() async {

    Response getResponse;

    getResponse = await DioClient.dioClient.fetch('propriedade/sem-tecnico');

    return getResponse;
  }

   Future<Response> getTecnico() async {

    String userId = SharedInfo.actualUser.idUsuario;

    Response getResponse = await DioClient.dioClient.fetch('usuario/$userId/');

    return getResponse;
  }

  Future<Response> updateProperty(String propertyId, var tecnico) async {
    
    Response response = await DioClient.dioClient.patch('propriedade/$propertyId/', {
      'tecnico': tecnico,
    // 'tecnico''usuario''cpf': tecnico['usuario']['cpf'],
    // 'tecnico''usuario''dataNascimento': tecnico['tecnico']['usuario']['dataNascimento'],
    // 'tecnico''usuario''telefone': tecnico['tecnico']['usuario']['telefone'],
    // 'tecnico''usuario''nome': tecnico['tecnico']['usuario']['nome'],
    // 'tecnico''crea': tecnico['tecnico']['crea'],
    // 'tecnico''formacao': tecnico['tecnico']['formacao'],       
    });

    return response;
  }

}
