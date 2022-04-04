import 'dart:convert';

class PesticideAplicationModel {
  final int id;
  final String pesticide;
  final String plantation;
  final int dosage;
  final String aplicationDate;
  final String photo;
  final String state;

  PesticideAplicationModel({
    required this.id,
    required this.pesticide,
    required this.plantation,
    required this.dosage,
    required this.aplicationDate,
    required this.photo,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pesticide': pesticide,
      'plantation': plantation,
      'dosage': dosage,
      'aplicationDate': aplicationDate,
      'photo': photo,
      'state': state,
    };
  }

  factory PesticideAplicationModel.fromMap(Map<String, dynamic> map) {
    return PesticideAplicationModel(
      id: map['id'],
      pesticide: map['pesticide'],
      plantation: map['plantation'],
      dosage: map['dosage'],
      aplicationDate: map['aplicationDate'],
      photo: map['photo'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PesticideAplicationModel.fromJson(String source) =>
      PesticideAplicationModel.fromMap(json.decode(source));
}
