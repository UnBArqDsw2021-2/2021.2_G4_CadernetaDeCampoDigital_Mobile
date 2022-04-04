import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/models/PesticideAplicationModel.dart';
import 'package:caderneta_campo_digital/pages/pendencies/components/pesticide_card.dart';
import 'package:flutter/material.dart';

class PendenciesPage extends StatefulWidget {
  const PendenciesPage({Key? key}) : super(key: key);

  @override
  State<PendenciesPage> createState() => _PendenciesPageState();
}

class _PendenciesPageState extends State<PendenciesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        hasActions: false,
        title: "Pendências",
        topbarHeight: size * 0.11,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PesticideCard(
              pesticide: PesticideAplicationModel(
                id: 1,
                pesticide: "pesticide",
                plantation: "plantation",
                dosage: 12,
                aplicationDate: "20/03/2022",
                photo: "photo",
                state: "state",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
