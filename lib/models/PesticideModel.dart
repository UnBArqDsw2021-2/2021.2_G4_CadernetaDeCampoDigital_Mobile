class PesticideType {
  final String id;
  final String name;

  PesticideType(this.id, this.name);

  static PesticideType fromJson(Map<String, dynamic> data) => PesticideType(
        data["idTipoPesticideo"],
        data["nome"],
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

  Pesticide(this.id, this.name, this.type);

  static Pesticide fromJson(Map<String, dynamic> data) => Pesticide(
        data["idPesticideo"],
        data["nome"],
        PesticideType(
          data["tipo"]["idTipoPesticideo"],
          data["tipo"]["nome"],
        ),
      );

  @override
  String toString() {
    return name;
  }
}
