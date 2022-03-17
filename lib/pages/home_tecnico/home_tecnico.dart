import 'package:caderneta_campo_digital/components/EstateCard/estate_card.dart';
import 'package:caderneta_campo_digital/components/PendencyCard/pendency_card.dart';
import 'package:caderneta_campo_digital/components/Topbar/topbar.dart';
import 'package:flutter/material.dart';

class HomeTecnico extends StatelessWidget {
  const HomeTecnico({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Topbar(topbarHeight: (size * 0.14)),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            PendencyCard(),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5,),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5,),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5,),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5,),
          ],
        ),
      ),
    );
  }
}
