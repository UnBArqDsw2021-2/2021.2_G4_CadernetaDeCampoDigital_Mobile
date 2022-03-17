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
    int pendencies = 5;

    return Container(
      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: border,
          ),
          elevation: 4,
          shadowColor: Color(0xFF03045e),
          child: InkWell(
            borderRadius: border,
            onTap: () {
              debugPrint('PendencyCard');
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
                      ),),
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
                  child: Text(
                    (pendencies.toString() + " Avaliações de agrotóxicos"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
