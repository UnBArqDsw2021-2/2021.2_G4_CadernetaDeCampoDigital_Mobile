import 'package:caderneta_campo_digital/components/alert_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  final response;
  final String? successMessage;
  final String? errorMessage;

  const MyWidget({
    Key? key,
    this.response,
    this.successMessage,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: Builder(builder: (BuildContext context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              final alertMessenger = AlertMessenger();
              if (response) {
                alertMessenger.successMessenger(context, successMessage);
              } else {
                alertMessenger.errorMessenger(context, errorMessage);
              }
            },
            child: SizedBox(
              width: 100,
              height: 50,
              key: Key('my_widget_button'),
            ),
          );
        }),
      ),
    );
  }
}

void main() {
  group('AlertMessenger component', () {
    var successMessage = 'Sucesso!';
    var errorMessage = 'Erro!';
    testWidgets('Should renders success message', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(
        response: true,
        successMessage: successMessage,
        errorMessage: errorMessage,
      ));

      final materialButton = find.byKey(Key('my_widget_button'));

      await tester.tap(materialButton, warnIfMissed: false);
      await tester.pump(Duration(seconds: 2));

      expect(find.text(successMessage), findsOneWidget);
      expect(find.text(errorMessage), findsNothing);
    });

    testWidgets('Should renders error message', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(
        response: false,
        successMessage: successMessage,
        errorMessage: errorMessage,
      ));

      final materialButton = find.byKey(Key('my_widget_button'));

      await tester.tap(materialButton, warnIfMissed: false);
      await tester.pump(Duration(seconds: 2));

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.text(successMessage), findsNothing);
    });
  });
}
