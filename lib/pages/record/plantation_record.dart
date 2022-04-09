import 'package:caderneta_campo_digital/components/page_base.dart';
import 'package:caderneta_campo_digital/global/colors.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecordPage extends StatelessWidget {
  final PlantioModel plantation;

  const RecordPage({Key? key, required this.plantation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PageBase(
      title: "Histórico",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.12,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: !plantation.isEmpty
                              ? Image.network(
                                  plantation.imageUrl.isNotEmpty
                                      ? plantation.imageUrl
                                      : 'https://blog.chbagro.com.br/user-files/blog/174577.jpg',
                                  loadingBuilder: (
                                    BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress,
                                  ) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }

                                    return SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: Shimmer.fromColors(
                                        baseColor: Color(0xFFEBEBF4),
                                        highlightColor: Color(0xFFF4F4F4),
                                        child: Container(
                                          color: Color(0xFFFFFFFF),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    );
                                  },
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  color: Color(0xFFFFFFFF),
                                  width: 50,
                                  height: 50,
                                ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Plantação: " + plantation.cultura.nome,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Data Plantio: " + plantation.dataPlantio,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Data Colheita: 05/03/2022",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("teste");
                        },
                        icon: Icon(
                          Icons.description_sharp,
                          color: MyColors().blue,
                        ),
                        padding: EdgeInsets.only(left: size.width * 0.06),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
