import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/models/PesticideModel.dart';
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
        hasToolbar: false,
        title: "Pendências",
        topbarHeight: size * 0.11,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              PesticideCard(
                pesticide: PesticideAplicationModel(
                  id: 1,
                  pesticide: "pesticide",
                  plantation: "plantation",
                  dosage: 12,
                  aplicationDate: DateTime.now(),
                  photo: "photo",
                  state: "state",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
