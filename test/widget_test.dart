import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caderneta_campo_digital/pages/login/login_page.dart';

void main() {
  LoginPage loginPage = LoginPage();

  Widget makeTestableWidget(widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets(
    'Testando campos inválidos no Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(loginPage));

      await tester.tap(find.widgetWithText(MaterialButton, "Entrar"));
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("Insira o seu CPF"), findsOneWidget);
      expect(find.text("Insira a sua senha"), findsOneWidget);
    },
  );

  testWidgets(
    'Renderiza página',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(loginPage));

      expect(find.text('LOGIN'), findsOneWidget);
    },
  );

  testWidgets(
    'Testando CPF inválido no Login',
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
}
