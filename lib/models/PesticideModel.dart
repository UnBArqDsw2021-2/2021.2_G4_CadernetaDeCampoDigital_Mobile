class PesticideType {
  final String id;
  final String name;

  PesticideType({required this.id, required this.name});

  factory PesticideType.fromMap(Map<String, dynamic> data) => PesticideType(
        id: data["idTipoAgrotoxico"],
        name: data["nome"],
      );

  @override
  String toString() {
    return name;
  }
}

class Pesticide {
  final String id;
  final String name;
  final PesticideType type;

  Pesticide({required this.id, required this.name, required this.type});

  factory Pesticide.fromMap(Map<String, dynamic> map) {
    return Pesticide(
      id: map["idAgrotoxico"],
      name: map["nome"],
      type: PesticideType(
        id: map["tipo"]["idTipoAgrotoxico"],
        name: map["tipo"]["nome"],
      ),
    );
  }

  @override
  String toString() {
    return name;
  }
}
