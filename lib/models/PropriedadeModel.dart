import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:caderneta_campo_digital/models/ProdutorModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/models/TecnicoModel.dart';
import 'package:tuple/tuple.dart';

class Propriedade {
  final String id;
  final String cep;
  final String estado;
  final String cidade;
  final String bairro;
  final String complemento;
  final int numeroCasa;
  final String hectares;
  final String logradouro;
  final ProdutorModel produtor;
  final TecnicoModel tecnico;
  final List<TalhaoModel> talhoes;

  Propriedade(
    this.id,
    this.cep,
    this.estado,
    this.cidade,
    this.bairro,
    this.complemento,
    this.numeroCasa,
    this.hectares,
    this.logradouro,
    this.produtor,
    this.tecnico,
    this.talhoes,
  );

  Tuple2<List<TalhaoModel>, List<TalhaoModel>> getPlotsActive({required List<TalhaoModel> plots}) {
    List<TalhaoModel> activePlots = [];
    List<TalhaoModel> nonActivePlots = [];
    bool isActive = false;

    for (TalhaoModel plot in plots) {
      isActive = false;
      for (PlantioModel plantation in plot.plantios) {
        if(plantation.estado == "Plantado") {
          plot.setButtonsToNotEmptyTalhao();
          activePlots.add(plot);
          isActive = true;
          break;
        }
      }

      if(!isActive) {
        plot.setButtonsToEmptyTalhao();
        nonActivePlots.add(plot);
      }
    }

    return Tuple2(activePlots, nonActivePlots);
  }
}
