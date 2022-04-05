import 'package:caderneta_campo_digital/models/propriedade.dart';
import 'package:caderneta_campo_digital/models/tecnico.dart';
import 'package:dio/dio.dart';

import '../../models/cultura.dart';
import '../../models/plantio.dart';
import '../../models/produtor.dart';
import '../../models/talhao.dart';
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

  List<Plantio> getPlantios(array) {
    List<Plantio> plantios = [];

    if(array.isEmpty) {
      plantios.add(Plantio.empty());
    } else {
      for (dynamic plantio in array) {
        plantios.add(
          Plantio(
            plantio['idPlantio'],
            Cultura(
              plantio['cultura']['idCultura'],
              plantio['cultura']['nome'],
            ),
            plantio['dataPlantio'],
            plantio['estado'],
            '',
            false,
          ),
        );
      }
    }

    return plantios;
  }

  List<Talhao> getTalhoes(array) {
    List<Talhao> talhoes = [];

    for (dynamic talhao in array) {
      talhoes.add(
        Talhao(
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
      Tecnico tecnico = estate['tecnico'] == null
          ? Tecnico.nulo()
          : Tecnico(
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
        Produtor(
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
