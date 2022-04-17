import 'package:caderneta_campo_digital/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

      await tester.tap(find.widgetWithText(TextButton, "Entrar"));
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

      final Finder buttonEntrar = find.byKey(const Key("Entrar_Button"));

      await tester.dragUntilVisible(
        buttonEntrar,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );

      await tester.tap(buttonEntrar);
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("CPF inválido"), findsOneWidget);
    },
  );
}
