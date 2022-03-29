import 'package:flutter/material.dart';

import '../../../components/plantation_card.dart';
import '../property_page.dart';

class TalhoesList extends StatelessWidget {
  final String title;
  final List<Talhao> talhoes;
  const TalhoesList({Key? key, required this.talhoes, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(11, 10, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 22,
            ),
          ),
        ),
        talhoes.isNotEmpty
            ? SizedBox(
                height: talhoes.length * size.height * 0.224,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: talhoes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              talhoes[index].title,
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.04,
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                print('histórico');
                              },
                              child: Text(
                                'histórico',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          PlantationCard(
                            plantation: talhoes[index].properties,
                          ),
                          Container(
                            height: 1,
                            width: size.width * 0.5,
                            margin: EdgeInsets.only(top: 12),
                            color: Color(0xFFB1B1B1),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Text(
                'Não possui talhões $title',
                style: TextStyle(
                  fontFamily: 'Roboto-regular',
                  color: Color(0xFF000000),
                  fontSize: 12,
                ),
              ),
      ],
    );
  }
}
