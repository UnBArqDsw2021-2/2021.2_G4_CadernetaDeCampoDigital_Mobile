class PesticideAplicationModel {
  final String id;
  final String produtor;
  final String aplicationDate;
  final String dosage;
  final String photo;
  final String cultura;
  final String pesticideId;

  PesticideAplicationModel({
    required this.id,
    required this.dosage,
    required this.aplicationDate,
    required this.photo,
    required this.cultura,
    required this.produtor,
    required this.pesticideId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cultura': cultura,
      'dosage': dosage,
      'aplicationDate': aplicationDate,
      'photo': photo,
      'produtor': produtor,
      'pesticideId': pesticideId,
    };
  }

  factory PesticideAplicationModel.fromMap(Map<String, dynamic> map) {
    return PesticideAplicationModel(
      id: map['id'],
      aplicationDate: map['aplicationDate'],
      photo: map['photo'],
      dosage: map['dosage'],
      cultura: map['cultura'],
      produtor: map['produtor'],
      pesticideId: map['pesticide'],
    );
  }
}
