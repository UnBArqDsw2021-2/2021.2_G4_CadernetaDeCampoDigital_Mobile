import 'package:caderneta_campo_digital/pages/register/producer_register/producer_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Technician Register page', () {
    ProducerRegisterPage producerPage = ProducerRegisterPage();

    Widget makeTestableWidget(widget) {
      return MaterialApp(
        home: widget,
      );
    }

    testWidgets(
      'Renderiza pagina de cadastro de tecnico',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget(producerPage));

        expect(find.text("CADASTRO"), findsOneWidget);
      },
    );
  });
}
