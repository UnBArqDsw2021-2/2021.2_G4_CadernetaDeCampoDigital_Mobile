import 'package:caderneta_campo_digital/components/loading.dart';
import 'package:caderneta_campo_digital/controllers/pesticide_analysis/pendency_controller.dart';
import 'package:caderneta_campo_digital/pages/pendencies/pendencies.dart';
import 'package:flutter/material.dart';

class PendencyCard extends StatefulWidget {
  const PendencyCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PendencyCard> createState() => _PendencyCardState();
}

class _PendencyCardState extends State<PendencyCard> {
  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.circular(15);
    Size size = MediaQuery.of(context).size;
    PendencyController pendencyController = PendencyController();

    return Container(
      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: border,
        ),
        elevation: 4,
        shadowColor: Color(0xFF03045e),
        child: InkWell(
          borderRadius: border,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return PendenciesPage();
              }),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.05,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF03045e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  "Pendências",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.center,
                child: FutureBuilder(
                  future: pendencyController.getPendencies(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.done
                        ? Text(
                            (pendencyController.pesticideAplications.length
                                    .toString() +
                                " Avaliações de agrotóxicos"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto-Regular',
                            ),
                          )
                        : Loading();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
