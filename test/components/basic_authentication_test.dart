import 'package:caderneta_campo_digital/components/base_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseAuthentication(
        label: "TESTE BASE AUTHENTICATION",
        isLoading: isLoading,
        child: Column(
          children: [
            Text("Child Texto 1"),
            MaterialButton(
              key: Key('basic_button_01'),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Basic authentication component ', () {
    testWidgets(
      'Should have label text and child component',
      (WidgetTester tester) async {
        await tester.pumpWidget(MyWidget());

        final button = find.byKey(Key('basic_button_01'));

        expect(find.text("TESTE BASE AUTHENTICATION"), findsOneWidget);
        expect(find.text("Child Texto 1"), findsOneWidget);
        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pump();
      },
    );
  });
}
