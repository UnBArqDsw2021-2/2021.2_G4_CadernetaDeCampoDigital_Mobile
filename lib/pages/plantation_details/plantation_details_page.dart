import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:flutter/material.dart';

class PlantationDetailsPage extends StatefulWidget {
  const PlantationDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantationDetailsPage> createState() => _PlantationDetailsPageState();
}

class _PlantationDetailsPageState extends State<PlantationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: size * 0.11,
        hasActions: false,
        title: "Plantação",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.04,
              ),
              width: size.width * 0.264,
              height: size.width * 0.264,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xFF000000),
              ),
            ),
            Text(
              "Morango Tropical",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
              ),
            ),
            Container(
              child: Text(
                "INFORMAÇÕES",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 22,
                ),
              ),
              margin: EdgeInsets.only(
                right: size.width * 0.48,
                top: size.height * 0.02,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: size.height * 0.03,
                ),
                width: size.width * 0.87,
                height: 1,
                color: Color(0xFF000000),
              ),
            ),
            Container(
              width: size.width * 0.87,
              height: size.height * 0.044,
              margin: EdgeInsets.only(
                bottom: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(134, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Text(
                "Data de plantio: 24/02/2022",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: size.width * 0.87,
              height: size.height * 0.044,
              margin: EdgeInsets.only(
                bottom: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(134, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Text(
                "Data de Colheita: 30/05/2022",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: size.width * 0.87,
              height: size.height * 0.044,
              margin: EdgeInsets.only(
                bottom: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(134, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Text(
                "Nº talhão: 22",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Text(
                "AGROTÓXICOS",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 22,
                ),
              ),
              margin: EdgeInsets.only(
                right: size.width * 0.48,
                top: size.height * 0.02,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: size.height * 0.03,
                ),
                width: size.width * 0.87,
                height: 1,
                color: Color(0xFF000000),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        image: AssetImage("assets/Agrotoxico.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: size.height * 0.11,
                    width: size.width * 0.18,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Nome: Aldrin"),
                        Text("Data Aplicação: 22/02/2022"),
                        Text("Período de Carência: 15 dias"),
                        Text("Data pós Carência: 09/03/2022"),
                      ],
                    ),
                  ),
                ],
              ),
              width: size.width * 0.87,
              height: size.height * 0.15,
              margin: EdgeInsets.only(
                bottom: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(134, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                "RESPONSÁVEL",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 22,
                ),
              ),
              margin: EdgeInsets.only(
                right: size.width * 0.48,
                top: size.height * 0.02,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: size.height * 0.03,
                ),
                width: size.width * 0.87,
                height: 1,
                color: Color(0xFF000000),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              width: size.width * 0.87,
              height: size.height * 0.15,
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        image: AssetImage("assets/Agrotoxico.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: size.height * 0.11,
                    width: size.width * 0.18,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Nome: Aldrin"),
                        Text("Data Aplicação: 22/02/2022"),
                        Text("Período de Carência: 15 dias"),
                        Text("Data pós Carência: 09/03/2022"),
                      ],
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                bottom: size.height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(134, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                    blurRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
