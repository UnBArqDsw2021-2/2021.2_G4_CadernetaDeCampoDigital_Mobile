import 'package:caderneta_campo_digital/models/PlantioModel.dart';

class TalhaoModel {
  final String id;
  final String idPropriedade;
  final int numero;
  final List<PlantioModel> plantios;
  List<TalhaoButton> buttons = [];

  TalhaoModel(this.id, this.idPropriedade, this.numero, this.plantios);

  void setButtonsToNotEmptyTalhao() {
    buttons = [
      TalhaoButton(id, numero, 'Adicionar agrotóxico', ButtonType.adicionarAgrotoxico),
      TalhaoButton(id, numero, 'Marcar como colhida', ButtonType.marcarComoColhido),
    ];
  }

  void setButtonsToEmptyTalhao() {
    buttons = [
      TalhaoButton(id, numero, 'Adicionar plantação', ButtonType.adicionarPlantacao),
    ];
  }
}

class TalhaoButton {
  final String idTalhao;
  final int numTalhao;
  final String title;
  final ButtonType buttonType;

  TalhaoButton(this.idTalhao, this.numTalhao, this.title, this.buttonType);
}

enum ButtonType {
  adicionarAgrotoxico,
  marcarComoColhido,
  adicionarPlantacao,
}
