import 'package:caderneta_campo_digital/models/models.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class AgrotoxicService {
  static Future<List<Agrotoxic>> getAgrotoxics() async {
    Response? agrotoxicResponse;

    agrotoxicResponse = await DioClient.dioClient.get(
      "agrotoxico/",
    );

    if (agrotoxicResponse?.statusCode == 200) {
      final List agrotoxics = agrotoxicResponse?.data;

      return agrotoxics.map((e) => Agrotoxic.fromJson(e)).toList();
    }

    throw Exception();
  }

  static Future<List<AgrotoxicType>> getAgrotoxicTypes() async {
    Response? typesResponse;

    typesResponse = await DioClient.dioClient.get(
      "agrotoxico/tipo",
    );

    if (typesResponse?.statusCode == 200) {
      final List agrotoxicTypes = typesResponse?.data;

      return agrotoxicTypes.map((e) => AgrotoxicType.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<Response> sendAgrotoxicTypeRegister(
    Map<String, dynamic> infoAgrotoxicType,
  ) async {
    Response response = await DioClient.dioClient.post('agrotoxico/tipo/', {
      'nome': infoAgrotoxicType['nome'],
    });

    return response;
  }

  Future<Response> sendAgrotoxicRegister(
    Map<String, dynamic> infoAgrotoxic,
  ) async {
    Response response = await DioClient.dioClient.post('agrotoxico/', {
      'nome': infoAgrotoxic['nome'],
      'tipo': infoAgrotoxic['tipo'],
    });

    return response;
  }

  Future<Response> sendAgrotoxicApplication(
    Map<String, dynamic> infoApplication,
  ) async {
    Response response =
        await DioClient.dioClient.post('plantio/aplicar/agrotoxico/', {
      'plantio': infoApplication['plantio'],
      'agrotoxico': infoApplication['agrotoxico'],
      'dataAplicacao': infoApplication['dataAplicacao'],
      'dosagemAplicacao': infoApplication['dosagemAplicacao'],
    });

    return response;
  }
}
