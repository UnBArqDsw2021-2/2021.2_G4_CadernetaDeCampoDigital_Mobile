import 'package:caderneta_campo_digital/components/estate_card.dart';
import 'package:caderneta_campo_digital/components/rounded_image_button.dart';
import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/pages/add_property/add_property.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeProdutorPage extends StatelessWidget {
  const HomeProdutorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Topbar(topbarHeight: (size * 0.14)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RoundedImagebutton(
              contents: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Adicionar\npropriedade',
                      style: Utils.estateTextStyle,
                    ),
                  ),
                ],
              ),
              image: 'assets/plus.png',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return AddPropertyPage();
                  }),
                );
              },
              backgroundColor: MyColors().blue,
            ),
            EstateCard(
              estateName: "Propriedade 1",
              estateAddress: "ENDERECO",
              qtdPlot: 5,
            ),
            EstateCard(
              estateName: "Propriedade 1",
              estateAddress: "ENDERECO",
              qtdPlot: 5,
            ),
            EstateCard(
              estateName: "Propriedade 1",
              estateAddress: "ENDERECO",
              qtdPlot: 5,
            ),
            EstateCard(
              estateName: "Propriedade 1",
              estateAddress: "ENDERECO",
              qtdPlot: 5,
            ),
          ],
        ),
      ),
    );
  }
}
