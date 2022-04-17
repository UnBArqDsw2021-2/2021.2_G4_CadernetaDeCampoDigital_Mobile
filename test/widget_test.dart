// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caderneta_campo_digital/pages/register/producer_register/producer_register_page.dart';
import 'package:caderneta_campo_digital/pages/register/technician_register/technician_register_page.dart';

void main() {
  testWidgets(
    'Renderiza pagina de cadastro de tecnico',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TechnicianRegisterPage()));

      expect(
        find.text("CADASTRO"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Renderiza pagina de cadastro de produtor',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProducerRegisterPage()));

      expect(
        find.text("CADASTRO"),
        findsOneWidget,
      );
    },
  );
}
