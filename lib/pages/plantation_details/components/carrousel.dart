import 'package:flutter/material.dart';

class Carroussel extends StatelessWidget {
  final List<dynamic> pestcides;
  final _scrollController = ScrollController();

  Carroussel({required this.pestcides, required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      children: pestcides
          .map(
            (element) => Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                children: [
                  SizedBox(
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
          )
          .toList(),
    );
  }
}
