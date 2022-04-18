import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class UpdatePropertyService {
  Future<Response> updateProperty(Map<String, dynamic> infoProperty) async {
    String id = infoProperty['id'];

    Response response = await DioClient.dioClient.patch('propriedade/$id/', {
      'cep': infoProperty['cep'],
      'bairro': infoProperty['bairro'],
      'estado': infoProperty['estado'],
      'cidade': infoProperty['cidade'],
      'complemento': infoProperty['complemento'],
      'numeroCasa': infoProperty['numeroCasa'],
      'hectares': infoProperty['hectares'],
      'logradouro': infoProperty['logradouro'],
    });

    return response;
  }
}
