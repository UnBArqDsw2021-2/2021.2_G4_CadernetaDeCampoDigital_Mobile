import 'package:flutter/material.dart';
import '../../components/basic_components.dart';
import '../../components/estate_card.dart';
import '../../components/loading.dart';
import '../../components/topbar_arrow_back.dart';
import '../../controllers/without_technician/without_technician.dart';
import '../../utils/utils.dart';

class WithoutTechnician extends StatefulWidget {
  const WithoutTechnician({Key? key}) : super(key: key);

  @override
  State<WithoutTechnician> createState() => _WithoutTechnicianState();
}

class _WithoutTechnicianState extends State<WithoutTechnician> {
  WithoutTechnicianController withoutTechnicianController =
      WithoutTechnicianController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        hasActions: false,
        title: "Pendências sem Técnico",
        topbarHeight: size * 0.11,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFieldBC(
                label: 'Nome da propriedade',
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          height: size.height * 0.75,
          child: FutureBuilder(
            future: withoutTechnicianController.getEstates(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.data == true
                      ? ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: withoutTechnicianController.estates.length,
                          itemBuilder: (context, index) {
                            return EstateCard(
                              estate: withoutTechnicianController.estates[index],
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
