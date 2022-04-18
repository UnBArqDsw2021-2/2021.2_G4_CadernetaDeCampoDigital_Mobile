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
      margin: EdgeInsets.only(top: 20, right: 10, left: 10),
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
                      'https://images.unsplash.com/photo-1560493676-04071c5f467b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
                      fit: BoxFit.fill,
                      height: size.width * 0.17,
                      width: size.width * 0.17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
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
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                    Text(
                      getQtdTalhoes(),
                      style: Utils.estateTextStyle,
                      overflow: TextOverflow.clip,
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
