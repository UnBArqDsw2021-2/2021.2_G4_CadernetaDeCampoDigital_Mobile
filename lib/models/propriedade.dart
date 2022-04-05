import 'package:caderneta_campo_digital/models/produtor.dart';
import 'package:caderneta_campo_digital/models/talhao.dart';
import 'package:caderneta_campo_digital/models/tecnico.dart';
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
  final Produtor produtor;
  final Tecnico tecnico;
  final List<Talhao> talhoes;

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

  Tuple2<List<Talhao>, List<Talhao>> getPlotsActive({required List<Talhao> plots}) {
    List<Talhao> activePlots = [];
    List<Talhao> nonActivePlots = [];

    for (Talhao plot in plots) {
      if(plot.plantios[0].isEmpty) {
        plot.setButtonsToEmptyTalhao();
        nonActivePlots.add(plot);
      } else {
        plot.setButtonsToNotEmptyTalhao();
        activePlots.add(plot);
      }
    }

    return Tuple2(activePlots, nonActivePlots);
  }
}
