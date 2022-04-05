import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/models/propriedade.dart';
import 'package:caderneta_campo_digital/pages/estate/components/plots_list.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class EstatePage extends StatefulWidget {
  final Propriedade estate;
  const EstatePage({Key? key, required this.estate}) : super(key: key);

  @override
  State<EstatePage> createState() => _EstatePageState();
}

class _EstatePageState extends State<EstatePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Tuple2 plots = widget.estate.getPlotsActive(plots: widget.estate.talhoes);

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: size * 0.11,
        hasActions: true,
        title: widget.estate.complemento,
      ),
      body: widget.estate.talhoes.isNotEmpty ? SingleChildScrollView(
        child: Column(
          children: [
            PlotsList(
              plots: plots.item1,
              title: 'Ativos',
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              width: size.width,
              height: 1,
              color: Color(0xFF000000),
            ),
            PlotsList(
              plots: plots.item2,
              title: 'Inativos',
            ),
          ],
        ),
      )
      : Center(
        child: Text('Não existem talhões', style: Utils.estateTextStyle),
      ),
    );
  }
}
