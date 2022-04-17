import 'package:caderneta_campo_digital/pages/pendencies/pendencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  PendenciesPage pendencies = PendenciesPage();
  Widget makeTestableWidget(widget) {
    return MaterialApp(
      home: widget,
    );
  }

  group('Pendencies page', () {
    testWidgets(
      'should render and tap pesticide card',
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(makeTestableWidget(pendencies)),
        );

        final pesticideCardFinder =
            find.byKey(Key('pendencies_pesticide_card'));

        expect(pesticideCardFinder, findsOneWidget);

        await tester.tap(pesticideCardFinder);
        tester.pumpAndSettle();
      },
    );
  });
}
