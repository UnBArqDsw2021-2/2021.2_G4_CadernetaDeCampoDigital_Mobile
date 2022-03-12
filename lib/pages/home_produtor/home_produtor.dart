import 'package:caderneta_campo_digital/components/EstateCard/estate_card.dart';
import 'package:flutter/material.dart';

class HomeProdutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.14,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Olá, José',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto-Bold',
                ),
              ),
              Text(
                'CPF: 55555555555',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ]),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 50,
            padding: EdgeInsets.all(30),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5),
            EstateCard(
                estateName: "Propriedade 1",
                estateAddress: "ENDERECO",
                qtdPlot: 5),
          ],
        ),
      ),
    );
  }
}
