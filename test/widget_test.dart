// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caderneta_campo_digital/pages/login/login_page.dart';
import 'package:caderneta_campo_digital/pages/register/ProducerRegister/main.dart';
import 'package:caderneta_campo_digital/pages/register/TechnicianRegister/main.dart';

void main() {
  LoginPage loginPage = LoginPage();

  Widget makeTestableWidget(widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets(
    'Campos inválidos no Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(loginPage));

      await tester.tap(find.widgetWithText(MaterialButton, "Entrar"));
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("Insira o seu CPF"), findsOneWidget);
      expect(find.text("Insira a sua senha"), findsOneWidget);
    },
  );

  testWidgets(
    'Renderiza página de Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(loginPage));

      expect(find.text('LOGIN'), findsOneWidget);
    },
  );

  testWidgets(
    'CPF inválido no Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(loginPage));

      await tester.enterText(find.byKey(Key("cpfField")), "067056");
      await tester.enterText(find.byKey(Key("passwordField")), "Teste123");
      await tester.pump(Duration(milliseconds: 500));
      await tester.tap(find.widgetWithText(MaterialButton, "Entrar"));
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("CPF inválido"), findsOneWidget);
    },
  );

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
