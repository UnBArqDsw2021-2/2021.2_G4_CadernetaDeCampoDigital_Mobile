import 'dart:convert';

class PesticideAplicationModel {
  final int id;
  final String produtor;
  final String aplicationDate;
  final int dosage;
  final String photo;
  final String cultura;

  PesticideAplicationModel({
    required this.id,
    required this.dosage,
    required this.aplicationDate,
    required this.photo,
    required this.cultura,
    required this.produtor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cultura': cultura,
      'dosage': dosage,
      'aplicationDate': aplicationDate,
      'photo': photo,
      'produtor': produtor,
    };
  }

  factory PesticideAplicationModel.fromMap(Map<String, dynamic> map) {
    return PesticideAplicationModel(
      id: map['idAplicacao'],
      aplicationDate: map['dataAplicacao'],
      photo: map['fotoAgrotoxico'],
      dosage: map['dosagemAplicacao'],
      cultura: map['plantio']['cultura']['nome'],
      produtor: map['produtor']['usuario']['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PesticideAplicationModel.fromJson(String source) =>
      PesticideAplicationModel.fromMap(json.decode(source));
}
