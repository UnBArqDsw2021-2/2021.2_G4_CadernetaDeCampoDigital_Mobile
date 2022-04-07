import 'package:caderneta_campo_digital/models/PesticideModel.dart';
import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class PesticideService {
  static Future<List<Pesticide>> getPesticides() async {
    Response? pesticideResponse;

    pesticideResponse = await DioClient.dioClient.get(
      "agrotoxico/",
    );

    if (pesticideResponse?.statusCode == 200) {
      final List pesticides = pesticideResponse?.data;

      return pesticides.map((e) => Pesticide.fromMap(e)).toList();
    }

    throw Exception();
  }

  static Future<List<PesticideType>> getPesticideTypes() async {
    Response? typesResponse;

    typesResponse = await DioClient.dioClient.get(
      "agrotoxico/tipo",
    );

    if (typesResponse?.statusCode == 200) {
      final List pesticideTypes = typesResponse?.data;

      return pesticideTypes.map((e) => PesticideType.fromMap(e)).toList();
    }

    throw Exception();
  }

  Future<Response> sendPesticideTypeRegister(
    Map<String, dynamic> infoPesticideType,
  ) async {
    Response response = await DioClient.dioClient.post('agrotoxico/tipo/', {
      'nome': infoPesticideType['nome'],
    });

    return response;
  }

  Future<Response> sendPesticideRegister(
    Map<String, dynamic> infoPesticide,
  ) async {
    Response response = await DioClient.dioClient.post('agrotoxico/', {
      'nome': infoPesticide['nome'],
      'tipo': infoPesticide['tipo'],
    });

    return response;
  }

  Future<Response> sendPesticideApplication(
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

  Future<Response> sendPesticideApplicationPhoto(
    Map<String, dynamic> infoApplication,
  ) async {
    Response response =
        await DioClient.dioClient.post('plantio/aplicar/agrotoxico/', {
      'plantio': infoApplication['plantio'],
      'dataAplicacao': infoApplication['dataAplicacao'],
      'dosagemAplicacao': infoApplication['dosagemAplicacao'],
      'fotoAgrotoxico': infoApplication['fotoAgrotoxico'],
    });

    return response;
  }
}
