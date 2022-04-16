import 'dart:math';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../controllers/without_technician/without_technician.dart';

class EstateIconCard extends StatelessWidget {
  final Propriedade estate;

  const EstateIconCard({
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
    WithoutTechnicianController withoutTechnicianController =
      WithoutTechnicianController();

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
            withoutTechnicianController.updateProperty(estate.id);
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
                width: size.width * 0.48,
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
              SizedBox(
                width: size.width * 0.02,
                child: IconButton(
                  iconSize: min(size.width * 0.08, size.height * 0.08),
                  icon: Icon(Icons.person_add_alt),
                  color: MyColors().darkBlue,
                  // ignore: no-empty-block
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
