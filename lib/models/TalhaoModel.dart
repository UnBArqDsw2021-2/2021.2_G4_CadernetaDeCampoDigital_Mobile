import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:flutter/cupertino.dart';

class TalhaoModel {
  final String id;
  final String idPropriedade;
  final int numero;
  final List<PlantioModel> plantios;
  List<TalhaoButton> buttons = [];

  TalhaoModel(this.id, this.idPropriedade, this.numero, this.plantios);

  void setButtonsToNotEmptyTalhao() {
    buttons = [
      TalhaoButton(id, 'Adicionar agrotóxico', () => debugPrint('Adicionar agrotóxico')),
      TalhaoButton(id, 'Marcar como colhida', () => debugPrint('Marcar como colhida')),
    ];
  }

  void setButtonsToEmptyTalhao() {
    buttons = [
      TalhaoButton(id, 'Adicionar plantação', () => debugPrint('Adicionar plantação')),
    ];
  }
}


class TalhaoButton {
  final String idTalhao;
  final String title;
  final Function onPressed;

  TalhaoButton(this.idTalhao, this.title, this.onPressed);
}