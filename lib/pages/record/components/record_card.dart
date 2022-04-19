import 'package:caderneta_campo_digital/components/rounded_image_button.dart';
import 'package:caderneta_campo_digital/controllers/record/plantation_record_controller.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final PlantioModel plantio;

  const RecordCard({Key? key, required this.plantio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return RoundedImagebutton(
      isAssetImage: false,
      //Adicionar navegação para página de detalhes quando existir
      onPressed: () {},
      contents: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Plantação: " + plantio.cultura.nome,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "Data Plantio: " +
                    PlantationRecordController.convertDataFromServer(
                      plantio.dataPlantio,
                    ),
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Data Colheita: 18/04/2022',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.03),
            child: Icon(
              Icons.description_sharp,
              color: MyColors().blue,
            ),
          ),
        ],
      ),
      image: plantio.cultura.imageUrl,
    );
  }
}
