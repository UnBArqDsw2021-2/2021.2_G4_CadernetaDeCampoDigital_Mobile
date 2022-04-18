import 'package:caderneta_campo_digital/components/rounded_image_button.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RoundedImagebutton(
            isAssetImage: true,
            key: Key('rounded_button'),
            contents: Center(
              child: Text(
                'Teste Rounded Button',
                style: Utils.estateTextStyle,
              ),
            ),
            image: 'assets/plus.png',
            onPressed: () {
              debugPrint('Teste Rounded Button Clicado');
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  group('Rounded Image Button component ', () {
    testWidgets(
      'Should render',
      (WidgetTester tester) async {
        await tester.pumpWidget(MyWidget());

        final button = find.byKey(Key('rounded_button'));

        expect(find.text('Teste Rounded Button'), findsOneWidget);
        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pumpAndSettle();
      },
    );
  });
}
