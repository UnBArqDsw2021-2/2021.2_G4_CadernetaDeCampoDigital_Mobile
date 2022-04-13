import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/pages/estate/estate_page.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class EstateCard extends StatelessWidget {
  final Propriedade estate;

  const EstateCard({
    Key? key,
    required this.estate,
  }) : super(key: key);

  String getAddress() {
    return estate.cidade + ' - ' + estate.estado + '\nCEP: ' + estate.cep;
  }

  String getQtdTalhoes() {
    return 'Número de talhões: ' + estate.talhoes.length.toString();
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return EstatePage(
                    estate: estate,
                    isProductorTheViewer: SharedInfo.actualUser.isProductor,
                  );
                },
              ),
            );
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
              SizedBox(
                width: size.width * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      estate.complemento,
                      style: Utils.estateTextStyle,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      getAddress(),
                      style: Utils.estateTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      getQtdTalhoes(),
                      style: Utils.estateTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
