import 'dart:convert';

class UserModel {
  final String name;
  final String cpf;
  final bool isProductor;
  final String accessToken;
  final String idUsuario;
  final String refreshToken;

  UserModel({
    required this.name,
    required this.cpf,
    required this.isProductor,
    required this.idUsuario,
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'idUsuario': idUsuario,
      'isProductor': isProductor,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      cpf: map['cpf'],
      isProductor: map['isProductor'],
      idUsuario: map['idUsuario'],
      accessToken: map['accesToken'],
      refreshToken: map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

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
