import 'dart:convert';

import 'package:caderneta_campo_digital/utils/utils.dart';

class AddPropertyModel {
  final String cep;
  final String cidade;
  final String uf;
  final String bairro;
  final String casa;
  final String logradouro;
  final String hectares;
  final String complemento;

  AddPropertyModel(
    this.cep,
    this.cidade,
    this.uf,
    this.bairro,
    this.casa,
    this.logradouro,
    this.hectares,
    this.complemento,
  );

  AddPropertyModel copyWith({
    String? cep,
    String? cidade,
    String? uf,
    String? bairro,
    String? casa,
    String? logradouro,
    String? hectares,
    String? complemento,
  }) {
    return AddPropertyModel(
      cep ?? this.cep,
      cidade ?? this.cidade,
      uf ?? this.uf,
      bairro ?? this.bairro,
      casa ?? this.casa,
      logradouro ?? this.logradouro,
      hectares ?? this.hectares,
      complemento ?? this.complemento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': Utils().clearMask(cep),
      'estado': uf,
      'cidade': cidade,
      'bairro': bairro,
      'complemento': complemento,
      'numeroCasa': casa,
      'hectares': hectares,
      'logradouro': logradouro,
    };
  }

  factory AddPropertyModel.fromMap(Map<String, dynamic> map) {
    return AddPropertyModel(
      map['cep'],
      map['cidade'],
      map['uf'],
      map['bairro'],
      map['casa'],
      map['logradouro'],
      map['hectares'],
      map['complemento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPropertyModel.fromJson(String source) =>
      AddPropertyModel.fromMap(json.decode(source));
}
