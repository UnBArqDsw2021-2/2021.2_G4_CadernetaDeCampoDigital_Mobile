import 'package:caderneta_campo_digital/pages/apply_pesticide/apply_pesticide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Apply pesticide page', () {
    const String plantationName = 'Morango';
    const plantationID = 'cbdcccf5-5a5c-4fb3-b174-32c037db7e57';
    const tilesNumber = 3;

    const applyPesticidePage = ApplyPesticidePage(
      plantationName: plantationName,
      plantationID: plantationID,
      tilesNumber: tilesNumber,
    );

    Widget makeTestableWidget(widget) {
      return MaterialApp(
        home: widget,
      );
    }

    testWidgets(
      'Should render plantation header, name and numbers of tiles',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(applyPesticidePage));

        final plantationHeaderFinder = find.text('INFORMAÇÕES DA PLANTAÇÃO');
        final plantationFinder = find.text('Plantação: $plantationName');
        final tilesNumberFinder = find.text('N° Talhão: $tilesNumber');

        expect(plantationHeaderFinder, findsOneWidget);
        expect(plantationFinder, findsOneWidget);
        expect(tilesNumberFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Should render and update pesticide form fields when known pesticide name',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(applyPesticidePage));

        final pesticideDateInput =
            DateFormat('dd/MM/yyyy').format(DateTime.now());

        const pesticideDosageInput = '2';
        const pesticideNameInput = 'Agrotoxico 1';
        const pesticideLackDaysInput = '25';

        final pesticideHeaderFinder = find.text('IDENTIFICAÇÃO DO AGROTÓXICO');
        final datePesticideFinder = find.byKey(Key('apply_pesticide_date'));
        final dosageFinder = find.byKey(Key('apply_pesticide_dosage'));
        final namePesticideCheck = find.text('Você Sabe o Nome do Agrotóxico?');
        final yesFinder = find.byKey(Key('yes_pesticide_known_name_check'));
        final noFinder = find.byKey(Key('no_pesticide_known_name_check'));
        final pesticideNameFinder = find.byKey(Key('apply_pesticide_name'));
        final lackDaysFinder = find.byKey(Key('apply_pesticide_lack_days'));

        expect(pesticideHeaderFinder, findsOneWidget);
        expect(datePesticideFinder, findsOneWidget);
        expect(dosageFinder, findsOneWidget);
        expect(namePesticideCheck, findsOneWidget);
        expect(yesFinder, findsOneWidget);
        expect(noFinder, findsOneWidget);

        await tester.enterText(datePesticideFinder, pesticideDateInput);
        await tester.pumpAndSettle();

        await tester.enterText(dosageFinder, pesticideDosageInput);
        await tester.pumpAndSettle();

        await tester.tap(yesFinder);
        await tester.pumpAndSettle();

        expect(find.text(pesticideDosageInput), findsOneWidget);

        expect(pesticideNameFinder, findsOneWidget);
        expect(lackDaysFinder, findsOneWidget);

        await tester.enterText(pesticideNameFinder, pesticideNameInput);
        await tester.pumpAndSettle();
        await tester.tap(find.text(pesticideNameInput).last);

        await tester.enterText(lackDaysFinder, pesticideLackDaysInput);
        await tester.pumpAndSettle();

        expect(find.text(pesticideNameInput), findsOneWidget);
        expect(find.text(pesticideLackDaysInput), findsOneWidget);
      },
    );
  });
}
