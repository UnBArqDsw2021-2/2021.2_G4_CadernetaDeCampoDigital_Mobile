import 'package:caderneta_campo_digital/components/topbar_arrow_back.dart';
import 'package:caderneta_campo_digital/pages/property/components/talhoes_list.dart';
import 'package:flutter/material.dart';

class Button {
  final String title;
  final Function onPressed;

  Button(this.title, this.onPressed);
}

class Plantation {
  final String name;
  final String plantingDate;
  final String serieNumber;
  final bool empty;
  final String imageUrl;
  final List<Button> buttons;

  Plantation({
    this.name = '',
    this.plantingDate = '',
    this.serieNumber = '',
    this.imageUrl = '',
    required this.empty,
    required this.buttons,
  });
}

class Talhao {
  final String title;
  final bool isActive;
  final Plantation properties;

  Talhao({
    required this.title,
    required this.isActive,
    required this.properties,
  });
}

class Property {
  final String name;
  final List<Talhao> talhoes;

  Property({required this.name, required this.talhoes});
}

class PropertyPage extends StatelessWidget {
  const PropertyPage({Key? key}) : super(key: key);

  List<Talhao> getTalhoes(returnActive, talhoes) {
    List<Talhao> aux = [];

    for (Talhao tal in talhoes) {
      if (tal.isActive == returnActive) {
        aux.add(tal);
      }
    }

    return aux;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Property property = Property(name: 'Fazenda Campinas Ouro Preto', talhoes: [
      Talhao(
        title: 'Talhão 1',
        isActive: true,
        properties: Plantation(
          name: 'Morango',
          plantingDate: '22/02/2021',
          serieNumber: '15451321',
          empty: false,
          imageUrl: 'https://ciclovivo.com.br/wp-content/uploads/2021/09/morango-hortalica-ciclovivo.jpg',
          buttons: [
            Button(
              'Adicionar agrotóxico',
              () {
                print('Adicionar agrotóxico');
              },
            ),
            Button(
              'Marcar como colhida',
              () {
                print('Marcar como colhida');
              },
            ),
          ],
        ),
      ),
      Talhao(
        title: 'Talhão 2',
        isActive: true,
        properties: Plantation(
          name: 'Uva',
          plantingDate: '22/02/2021',
          serieNumber: '58222581',
          empty: false,
          imageUrl: 'https://revistacampoenegocios.com.br/wp-content/uploads/2021/09/Uva.jpg',
          buttons: [
            Button(
              'Adicionar agrotóxico',
              () {
                print('Adicionar agrotóxico');
              },
            ),
            Button(
              'Marcar como colhida',
              () {
                print('Marcar como colhida');
              },
            ),
          ],
        ),
      ),
      Talhao(
        title: 'Talhão 3',
        isActive: true,
        properties: Plantation(
          name: 'Abacaxi',
          plantingDate: '22/02/2021',
          serieNumber: '35453435',
          empty: false,
          imageUrl: 'https://conteudo.imguol.com.br/c/entretenimento/04/2017/12/11/abacaxi-1513012505452_v2_450x337.jpg',
          buttons: [
            Button(
              'Adicionar agrotóxico',
              () {
                print('Adicionar agrotóxico');
              },
            ),
            Button(
              'Marcar como colhida',
              () {
                print('Marcar como colhida');
              },
            ),
          ],
        ),
      ),
      Talhao(
        title: 'Talhão 4',
        isActive: false,
        properties: Plantation(
          empty: true,
          buttons: [
            Button(
              'Adicionar plantação',
              () {
                print('Adicionar plantação');
              },
            ),
          ],
        ),
      ),
      Talhao(
        title: 'Talhão 5',
        isActive: false,
        properties: Plantation(
          empty: true,
          buttons: [
            Button(
              'Adicionar plantação',
              () {
                print('Adicionar plantação');
              },
            ),
          ],
        ),
      ),
      Talhao(
        title: 'Talhão 6',
        isActive: false,
        properties: Plantation(
          empty: true,
          buttons: [
            Button(
              'Adicionar plantação',
              () {
                print('Adicionar plantação');
              },
            ),
          ],
        ),
      ),
    ]);

    List<Talhao> ativos = getTalhoes(true, property.talhoes);
    List<Talhao> inativos = getTalhoes(false, property.talhoes);

    return Scaffold(
      appBar: TopbarArrowBack(
        topbarHeight: size * 0.11,
        hasToolbar: true,
        title: property.name,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TalhoesList(talhoes: ativos, title: 'Ativos'),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: size.width,
              height: 1,
              color: Color(0xFF000000),
            ),
            TalhoesList(talhoes: inativos, title: 'Inativos'),
          ],
        ),
      ),
    );
  }
}
