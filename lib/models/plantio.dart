import 'package:caderneta_campo_digital/models/cultura.dart';

class Plantio {
  late String id;
  late Cultura cultura;
  late String dataPlantio;
  late String estado;
  late String imageUrl = '';
  late bool isEmpty;

  Plantio(this.id, this.cultura, this.dataPlantio, this.estado, this.imageUrl, this.isEmpty);

  Plantio.empty() {
    id = '';
    cultura = Cultura('', '');
    dataPlantio = '';
    estado = '';
    imageUrl = '';
    isEmpty = true;
  }
}