import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class WithoutTechnicianService {
  Future<Response> getData() async {

    Response getResponse;

    getResponse = await DioClient.dioClient.fetch('propriedade/sem-tecnico');

    return getResponse;
  }

  Future<Response> updateProperty(String propertyId, String cpf) async {
    
    Response response = await DioClient.dioClient.patch('propriedade/$propertyId/', {
      'tecnico': cpf,
    });

    return response;
  }

}
