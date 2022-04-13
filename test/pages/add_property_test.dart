import 'package:caderneta_campo_digital/controllers/add_property/add_property_controller.dart';
import 'package:caderneta_campo_digital/models/AddPropertyModel.dart';
import 'package:caderneta_campo_digital/pages/add_property/add_property.dart';
import 'package:caderneta_campo_digital/services/add_property/add_property_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'add_property_test.mocks.dart';

@GenerateMocks([AddPropertyController, AddPropertyService, AddPropertyModel])
void main() {
  MockAddPropertyService addPropertyService = MockAddPropertyService();

  group('Add property page', () {
    const addPropertyPage = AddPropertyPage();

    Widget makeTestableWidget(widget) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AddPropertyController(addPropertyService),
          ),
        ],
        child: MaterialApp(
          home: widget,
        ),
      );
    }

    Future dragTesterUntilVisible(tester, finder) async {
      await tester.dragUntilVisible(
        finder,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );
    }

    testWidgets(
      'should have CEP, Cidade, Estado, Bairro, Casa, Logradouro and Hectares fields',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(addPropertyPage));
        // when(addPropertyController.submit()).thenAnswer(
        //   (_) async => {'response': true},
        // );

        final cepInputFinder = find.text('CEP');
        final cityInputFinder = find.text('Cidade');
        final stateInputFinder = find.text('Estado');
        final streetInputFinder = find.text('Bairro');
        final houseInputFinder = find.text('Casa');
        final addressInputFinder = find.text('Logradouro');
        final hectaresInputFinder = find.text('Hectares');

        expect(cepInputFinder, findsOneWidget);
        expect(cityInputFinder, findsOneWidget);
        expect(stateInputFinder, findsOneWidget);
        expect(streetInputFinder, findsOneWidget);
        expect(houseInputFinder, findsOneWidget);
        expect(addressInputFinder, findsOneWidget);
        expect(hectaresInputFinder, findsOneWidget);
      },
    );

    testWidgets(
      'should update fields',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(addPropertyPage));

        const cidade = 'Boa Vista';
        const estado = 'RR';
        const bairro = 'Liberdade';
        const casa = '432';
        const logradouro = 'Rua Helena Bezerra de Menezes';
        const hectares = '2342.1';
        const complement = 'teste';

        var cepInputFinder = find.byKey(Key('add_property_cep_field'));
        var cityInputFinder = find.byKey(Key('add_property_cidade_field'));
        var stateInputFinder = find.text('Estado');
        var streetInputFinder = find.byKey(Key('add_property_bairro_field'));
        var houseInputFinder = find.byKey(Key('add_property_casa_field'));
        var addressInputFinder =
            find.byKey(Key('add_property_logradouro_field'));
        var hectaresInputFinder =
            find.byKey(Key('add_property_hectares_field'));

        var complementInputFinder =
            find.byKey(Key('add_property_complemento_field'));

        await tester.enterText(cepInputFinder, '69309079');
        await tester.pumpAndSettle();

        await tester.enterText(cityInputFinder, cidade);
        await tester.pumpAndSettle();

        await tester.tap(stateInputFinder, warnIfMissed: false);
        await tester.pumpAndSettle();
        await tester.tap(find.text(estado).last, warnIfMissed: false);
        await tester.pumpAndSettle();

        await tester.enterText(streetInputFinder, bairro);
        await tester.pumpAndSettle();

        await tester.enterText(houseInputFinder, casa);
        await tester.pumpAndSettle();

        await tester.enterText(addressInputFinder, logradouro);
        await tester.pumpAndSettle();

        await tester.enterText(hectaresInputFinder, hectares);
        await tester.pumpAndSettle();

        await tester.enterText(complementInputFinder, complement);
        await tester.pumpAndSettle();

        cepInputFinder = find.text('69.309-079');
        cityInputFinder = find.text(cidade);
        stateInputFinder = find.text(estado);
        streetInputFinder = find.text(bairro);
        houseInputFinder = find.text(casa);
        addressInputFinder = find.text(logradouro);
        hectaresInputFinder = find.text(hectares);
        complementInputFinder = find.text(complement);

        expect(cepInputFinder, findsOneWidget);
        expect(cityInputFinder, findsOneWidget);
        expect(stateInputFinder, findsOneWidget);
        expect(streetInputFinder, findsOneWidget);
        expect(houseInputFinder, findsOneWidget);
        expect(addressInputFinder, findsOneWidget);
        expect(hectaresInputFinder, findsOneWidget);
        expect(complementInputFinder, findsOneWidget);

        final button = find.byKey(Key('add_property_adicionar'));
        expect(button, findsOneWidget);
      },
    );
  });
}
