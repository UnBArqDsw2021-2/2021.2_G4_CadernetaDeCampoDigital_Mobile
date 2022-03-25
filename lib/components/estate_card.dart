import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class EstateCard extends StatelessWidget {
  final String estateName;
  final String estateAddress;
  final int qtdPlot;

  const EstateCard({
    Key? key,
    required this.estateName,
    required this.estateAddress,
    required this.qtdPlot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.circular(15);
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: border,
        ),
        elevation: 4,
        child: InkWell(
          borderRadius: border,
          onTap: () {
            debugPrint('EstateCard');
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: border,
                  child: InkWell(
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.fill,
                      height: size.width * 0.17,
                      width: size.width * 0.17,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    estateName,
                    style: Utils.estateTextStyle,
                  ),
                  Text(
                    estateAddress,
                    style: Utils.estateTextStyle,
                  ),
                  Text(
                    qtdPlot.toString(),
                    style: Utils.estateTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
