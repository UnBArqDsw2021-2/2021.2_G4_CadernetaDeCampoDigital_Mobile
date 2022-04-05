import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class AddPropertyService {
  Future<Response> createProperty(
    Map<String, dynamic> infoProperty,
  ) async {
    Response response = await DioClient.dioClient.post('propriedade/', {
      'cep': infoProperty['cep'],
      'estado': infoProperty['estado'],
      'cidade': infoProperty['cidade'],
      'bairro': infoProperty['bairro'],
      'complemento': infoProperty['complemento'],
      'numeroCasa': infoProperty['numeroCasa'],
      'hectares': infoProperty['hectares'],
      'logradouro': infoProperty['logradouro'],
      'produtor': infoProperty['produtor'],
    });

    return response;
  }
}
