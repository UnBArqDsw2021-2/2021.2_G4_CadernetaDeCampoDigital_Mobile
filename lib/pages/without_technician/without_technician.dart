import 'package:flutter/material.dart';

import '../../components/basic_components.dart';
import '../../components/estate_card.dart';
import '../../components/loading.dart';
import '../../components/topbar_arrow_back.dart';
import '../../utils/utils.dart';

class WithoutTechnician extends StatefulWidget {
  const WithoutTechnician({ Key? key }) : super(key: key);

  @override
  State<WithoutTechnician> createState() => _WithoutTechnicianState();
}

class _WithoutTechnicianState extends State<WithoutTechnician> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        hasActions: false,
        title: "Pendências sem Técnico",
        topbarHeight: size * 0.11,
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
          children: [
            TextFieldBC(
              label: "Nome da Propriedade",
              keyboardType: TextInputType.text,
            ),    
          ],
      ),
        ),
      ),
    );
  }
}