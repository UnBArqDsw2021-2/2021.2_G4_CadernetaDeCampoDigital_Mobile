import 'package:caderneta_campo_digital/components/estate_card.dart';
import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/controllers/home_produtor/home_produtor_controller.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeProdutorPage extends StatefulWidget {
  const HomeProdutorPage({Key? key}) : super(key: key);

  @override
  State<HomeProdutorPage> createState() => _HomeProdutorPageState();
}

class _HomeProdutorPageState extends State<HomeProdutorPage> {
  HomeProdutorController homeProdutorController = HomeProdutorController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Topbar(topbarHeight: (size * 0.14)),
      body: FutureBuilder(
        future: homeProdutorController.getEstates(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.data == true
                  ? ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return EstateCard(
                          estate: homeProdutorController.estates[index],
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Não existem propriedades',
                        style: Utils.estateTextStyle,
                      ),
                    )
              : Loading();
        },
      ),
    );
  }
}
