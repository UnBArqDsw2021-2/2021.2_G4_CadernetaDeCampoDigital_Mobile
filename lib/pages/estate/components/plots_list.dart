import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:flutter/material.dart';

import '../../../components/plantation_card.dart';
import '../../../models/PlantioModel.dart';
import '../../../models/TalhaoModel.dart';

class PlotsList extends StatelessWidget {
  final String title;
  final List<TalhaoModel> plots;
  final Propriedade estate;
  const PlotsList({
    Key? key,
    required this.plots,
    required this.title,
    required this.estate,
  }) : super(key: key);

  PlantioModel getActivePlantio(List<PlantioModel> plantios) {
    String estado;
    if (title == "Ativos") {
      estado = "Plantado";
      for (PlantioModel plantio in plantios) {
        if (plantio.estado == estado) {
          return plantio;
        }
      }
    }

    return PlantioModel.empty();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(11, 10, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 22,
            ),
          ),
        ),
        plots.isNotEmpty
            ? SizedBox(
                height: plots.length * size.height * 0.224,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: plots.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Talhão ' + plots[index].numero.toString(),
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.04,
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                debugPrint('histórico');
                              },
                              child: Text(
                                'Histórico',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          PlantationCard(
                            plantation: getActivePlantio(plots[index].plantios),
                            buttons: plots[index].buttons,
                            talhao: plots[index],
                            estate: estate,
                          ),
                          Container(
                            height: 1,
                            width: size.width * 0.5,
                            margin: EdgeInsets.only(top: 12),
                            color: Color(0xFFB1B1B1),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Text(
                'Não possui talhões $title',
                style: TextStyle(
                  fontFamily: 'Roboto-regular',
                  color: Color(0xFF000000),
                  fontSize: 12,
                ),
              ),
      ],
    );
  }
}
