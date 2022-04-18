import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/controllers/pesticide_analysis/pendency_controller.dart';
import 'package:caderneta_campo_digital/pages/pendencies/components/pesticide_card.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class PendenciesPage extends StatefulWidget {
  const PendenciesPage({Key? key}) : super(key: key);

  @override
  State<PendenciesPage> createState() => _PendenciesPageState();
}

class _PendenciesPageState extends State<PendenciesPage> {
  @override
  Widget build(BuildContext context) {
    PendencyController pendencyController = PendencyController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        hasActions: false,
        title: "Pendências",
        topbarHeight: size * 0.11,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: FutureBuilder(
          future: pendencyController.getPendencies(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? pendencyController.pesticideAplications.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount:
                            pendencyController.pesticideAplications.length,
                        itemBuilder: (context, index) {
                          return PesticideCard(
                            key: Key('pendencies_pesticide_card'),
                            pesticide:
                                pendencyController.pesticideAplications[index],
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'Nenhuma pendência encontrada',
                          style: Utils.estateTextStyle,
                        ),
                      )
                : Loading();
          },
        ),
      ),
    );
  }
}
