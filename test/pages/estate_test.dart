import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/CulturaModel.dart';
import 'package:caderneta_campo_digital/models/PlantioModel.dart';
import 'package:caderneta_campo_digital/models/ProdutorModel.dart';
import 'package:caderneta_campo_digital/models/PropriedadeModel.dart';
import 'package:caderneta_campo_digital/models/TalhaoModel.dart';
import 'package:caderneta_campo_digital/models/TecnicoModel.dart';
import 'package:caderneta_campo_digital/models/UserModel.dart';
import 'package:caderneta_campo_digital/pages/estate/estate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  initializeDateFormatting();
  group('Estate page', () {
    final UserModel user = UserModel(
      name: 'Fabiana Julia Jesus',
      cpf: '640.158.159-04',
      isProductor: true,
      idUsuario: '02',
      accessToken: 'access-token',
      refreshToken: 'refresh-token',
    );

    SharedInfo.actualUser = user;

    final ProdutorModel produtor = ProdutorModel(
      '640.158.159-04',
      '01/03/1984',
      '(45) 99508-5952',
      'Fabiana Julia Jesus',
      'ADS1234567890098765432112',
    );
    final TecnicoModel tecnico = TecnicoModel(
      '123',
      '08/01/2000',
      '(91) 99987-3481',
      '280.176.638-03',
      '1234567890',
      'Agronomia',
    );
    final CulturaModel cultura = CulturaModel('1', 'Morango');
    PlantioModel plantio = PlantioModel(
      '222',
      cultura,
      '2022-01-02',
      'Plantado',
      '',
      false,
    );

    final TalhaoModel talhao = TalhaoModel('234', '1', 3, [plantio]);
    final Propriedade propriedade = Propriedade(
      '1',
      '72455490',
      'DF',
      'Gama',
      'Central',
      'Perto de uma igreja',
      13442,
      '233.4',
      'Quadra 02',
      produtor,
      tecnico,
      [talhao],
    );

    final estatePage = EstatePage(
      estate: propriedade,
      isProductorTheViewer: true,
    );

    Widget makeTestableWidget(widget) {
      return MaterialApp(
        home: widget,
      );
    }

    testWidgets(
      'Should render active and unactives plots',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(makeTestableWidget(estatePage)),
        );

        final activePlotsFinder = find.byKey(Key('estate_active_plots_list'));
        final unactivePlotsFinder =
            find.byKey(Key('estate_unactive_plots_list'));

        expect(activePlotsFinder, findsOneWidget);
        expect(unactivePlotsFinder, findsOneWidget);
      },
    );
  });
}
