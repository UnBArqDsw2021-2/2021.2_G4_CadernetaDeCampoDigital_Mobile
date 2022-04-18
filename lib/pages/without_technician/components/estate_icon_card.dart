import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../controllers/without_technician/without_technician.dart';
import '../../../global/global.dart';
import '../../estate/estate_page.dart';
import '../../home_tecnico/home_tecnico.dart';

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
    String cpf = SharedInfo.actualUser.cpf;
    Size size = MediaQuery.of(context).size;
    WithoutTechnicianController withoutTechnicianController =
        WithoutTechnicianController();


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
              Container(
                width: size.width * 0.23,
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: border,
                  child: InkWell(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1560493676-04071c5f467b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
                      fit: BoxFit.fill,
                      height: size.height * 0.08,
                      width: size.width * 0.17,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.50,
                alignment: Alignment.centerLeft,
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
              Container(
                width: size.width * 0.12,
                alignment: Alignment.center,
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.person_add_alt),
                  color: MyColors().darkBlue,
                  onPressed: () async {
                    await withoutTechnicianController.updateProperty(
                      estate.id,
                      cpf,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return HomeTecnicoPage();
                      }),
                    );
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
