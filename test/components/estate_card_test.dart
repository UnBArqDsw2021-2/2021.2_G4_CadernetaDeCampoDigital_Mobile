import 'package:caderneta_campo_digital/components/base_authentication.dart';
import 'package:caderneta_campo_digital/components/estate_card.dart';
import 'package:caderneta_campo_digital/models/CulturaModel.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:caderneta_campo_digital/models/ProdutorModel.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/models/TecnicoModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

final ProdutorModel _produtor = ProdutorModel(
  '640.158.159-04',
  '01/03/1984',
  '(45) 99508-5952',
  'Fabiana Julia Jesus',
  'ADS1234567890098765432112',
);
final TecnicoModel _tecnico = TecnicoModel(
  '123',
  '08/01/2000',
  '(91) 99987-3481',
  '280.176.638-03',
  '1234567890',
  'Agronomia',
);
final CulturaModel _cultura = CulturaModel('1', 'Morango', '');
PlantioModel _plantio = PlantioModel(
  '222',
  _cultura,
  '2022-01-02',
  'Plantado',
  false,
);

final TalhaoModel _talhao = TalhaoModel('234', '1', 3, [_plantio]);

final Propriedade _propriedade = Propriedade(
  '1',
  '72455490',
  'DF',
  'Gama',
  'Central',
  'Perto de uma igreja',
  13442,
  '233.4',
  'Quadra 02',
  _produtor,
  _tecnico,
  [_talhao],
);

class MyWidget extends StatefulWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseAuthentication(
        label: "TESTE BASE AUTHENTICATION",
        isLoading: isLoading,
        child: Column(
          children: [
            EstateCard(estate: _propriedade),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Estate card component ', () {
    testWidgets(
      'Should render',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(MyWidget()),
        );
      },
    );
  });
}
