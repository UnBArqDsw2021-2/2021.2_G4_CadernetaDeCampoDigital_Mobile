import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/pages/home_tecnico/components/pendency_card.dart';
import 'package:caderneta_campo_digital/pages/without_technician/without_technician.dart';
import 'package:flutter/material.dart';
import '../../components/icon_text_button.dart';
import '../../global/colors.dart';

class HomeTecnicoPage extends StatelessWidget {
  const HomeTecnicoPage({Key? key}) : super(key: key);
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
            0.07, 
            borderColor: MyColors().darkBlue,
            fontSize: size.width * 0.05,
            onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return WithoutTechnician();
                })),
            ),
            
            // EstateCard(
            //   estateName: "Propriedade 1",
            //   estateAddress: "ENDERECO",
            //   qtdPlot: 5,
            // ),
            // EstateCard(
            //   estateName: "Propriedade 1",
            //   estateAddress: "ENDERECO",
            //   qtdPlot: 5,
            // ),
            // EstateCard(
            //   estateName: "Propriedade 1",
            //   estateAddress: "ENDERECO",
            //   qtdPlot: 5,
            // ),
            // EstateCard(
            //   estateName: "Propriedade 1",
            //   estateAddress: "ENDERECO",
            //   qtdPlot: 5,
            // ),
          ],
        ),
      ),
    );
  }
}
