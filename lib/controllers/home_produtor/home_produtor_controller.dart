import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TecnicoModel.dart';
import 'package:dio/dio.dart';

import '../../models/CulturaModel.dart';
import '../../models/PlantioModel.dart';
import '../../models/ProdutorModel.dart';
import '../../models/TalhaoModel.dart';
import '../../services/home_productor/home_productor_service.dart';

class HomeProdutorController {
  HomeProdutorService homeProdutorService = HomeProdutorService();
  bool loading = false;
  List<Propriedade> estates = [];

  Future<bool> getEstates() async {
    Response response = await homeProdutorService.getData();
    loading = false;

    if (response.data == null) {
      return false;
    }

    setData(response.data);

    return true;
  }

  List<PlantioModel> getPlantios(array) {
    List<PlantioModel> plantios = [];

    for (dynamic plantio in array) {
      plantios.add(
        PlantioModel(
          plantio['idPlantio'],
          CulturaModel(
            plantio['cultura']['idCultura'],
            plantio['cultura']['nome'],
          ),
          plantio['dataPlantio'],
          plantio['estado'],
          plantio['cultura']['foto'],
          false,
        ),
      );
    }

    return plantios;
  }

  List<TalhaoModel> getTalhoes(array) {
    List<TalhaoModel> talhoes = [];

    for (dynamic talhao in array) {
      talhoes.add(
        TalhaoModel(
          talhao['idTalhao'],
          talhao['idPropriedade'],
          talhao['numero'],
          getPlantios(talhao['plantio']),
        ),
      );
    }

    return talhoes;
  }

  void setData(data) {
    estates = [];
    for (dynamic estate in data) {
      var produtor = estate['produtor'];
      TecnicoModel tecnico = estate['tecnico'] == null
          ? TecnicoModel.nulo()
          : TecnicoModel(
              estate['tecnico']['usuario']['cpf'],
              estate['tecnico']['usuario']['dataNascimento'],
              estate['tecnico']['usuario']['telefone'],
              estate['tecnico']['usuario']['nome'],
              estate['tecnico']['crea'],
              estate['tecnico']['formacao'],
            );

      estates.add(Propriedade(
        estate['idPropriedade'],
        estate['cep'],
        estate['estado'],
        estate['cidade'],
        estate['bairro'],
        estate['complemento'],
        estate['numeroCasa'],
        estate['hectares'],
        estate['logradouro'],
        ProdutorModel(
          produtor['usuario']['cpf'],
          produtor['usuario']['dataNascimento'],
          produtor['usuario']['telefone'],
          produtor['usuario']['nome'],
          produtor['dap'],
        ),
        tecnico,
        getTalhoes(estate['talhao']),
      ));
    }
  }
}
