import 'package:caderneta_campo_digital/services/dio.dart';
import 'package:dio/dio.dart';

class AgrotoxicType {
  final String id;
  final String name;

  AgrotoxicType(this.id, this.name);

  static AgrotoxicType fromJson(Map<String, dynamic> data) => AgrotoxicType(
        data["idTipoAgrotoxico"],
        data["nome"],
      );

  @override
  String toString() {
    return name;
  }
}

class Agrotoxic {
  final String id;
  final String name;
  final AgrotoxicType type;

  Agrotoxic(this.id, this.name, this.type);

  static Agrotoxic fromJson(Map<String, dynamic> data) => Agrotoxic(
        data["idAgrotoxico"],
        data["nome"],
        AgrotoxicType(
          data["tipo"]["idTipoAgrotoxico"],
          data["tipo"]["nome"],
        ),
      );

  @override
  String toString() {
    return name;
  }
}

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
}
