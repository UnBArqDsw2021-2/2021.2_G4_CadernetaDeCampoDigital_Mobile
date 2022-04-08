import 'package:caderneta_campo_digital/models/CulturaModel.dart';

class PlantioModel {
  late String id;
  late CulturaModel cultura;
  late String dataPlantio;
  late String estado;
  late String imageUrl = '';
  late bool isEmpty;

  PlantioModel(this.id, this.cultura, this.dataPlantio, this.estado, this.imageUrl, this.isEmpty);

  PlantioModel.empty() {
    id = '';
    cultura = CulturaModel('', '');
    dataPlantio = '';
    estado = '';
    imageUrl = '';
    isEmpty = true;
  }
}