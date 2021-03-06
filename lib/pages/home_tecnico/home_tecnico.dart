import 'package:caderneta_campo_digital/components/estate_card.dart';
import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/controllers/home_tecnico/home_tecnico_controller.dart';
import 'package:caderneta_campo_digital/pages/home_tecnico/components/pendency_card.dart';
import 'package:caderneta_campo_digital/pages/without_technician/without_technician.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../components/icon_text_button.dart';
import '../../global/colors.dart';



class HomeTecnicoPage extends StatefulWidget {
  const HomeTecnicoPage({Key? key}) : super(key: key);

  @override
  State<HomeTecnicoPage> createState() => _HomeTecnicoPageState();
}

class _HomeTecnicoPageState extends State<HomeTecnicoPage> {
  HomeTecnicoController homeTecnicoController = HomeTecnicoController();

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;

    return Scaffold(
      appBar: Topbar(topbarHeight: (MediaQuery.of(context).size * 0.14)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PendencyCard(),
            IconTextButton(
            'Propriedades sem Técnico',
            size, 
            Icon(
              Icons.other_houses_outlined,
              color: MyColors().darkBlue,
              size: size.width * 0.07,
            ),
            0.95, 
            0.06, 
            0.05, 
            borderColor: MyColors().darkBlue,
            fontSize: size.width * 0.05,
            onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return WithoutTechnician();
                })),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: FutureBuilder(
                future: homeTecnicoController.getEstates(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? snapshot.data == true
                          ? ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: homeTecnicoController.estates.length,
                              itemBuilder: (context, index) {
                                return EstateCard(
                                  estate: homeTecnicoController.estates[index],
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
            ),
          ],
        ),
      ),
    );
  }
}
