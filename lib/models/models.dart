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
