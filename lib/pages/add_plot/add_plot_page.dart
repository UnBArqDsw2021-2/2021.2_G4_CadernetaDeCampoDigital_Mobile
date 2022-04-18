import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:flutter/material.dart';

class AddPlotPage extends StatefulWidget {
  final Propriedade estate;

  const AddPlotPage({Key? key, required this.estate}) : super(key: key);

  @override
  State<AddPlotPage> createState() => _AddPlotPageState();
}

class _AddPlotPageState extends State<AddPlotPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: size * 0.11,
        hasActions: true,
        title: "Talhao (${widget.estate.complemento})",
      ),
      body: Center(
        child: Text("Adicionar talhao"),
      ),
    );
  }
}
