import 'package:caderneta_campo_digital/components/topbar.dart';
import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/UserModel.dart';
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
        appBar: Topbar(topbarHeight: Size(100, 100)),
        body: Center(
          child: Text("Teste"),
        ),
      ),
    );
  }
}

void main() {
  final UserModel user = UserModel(
    name: 'Fabiana Julia Jesus',
    cpf: '640.158.159-04',
    isProductor: true,
    idUsuario: '02',
    accessToken: 'access-token',
    refreshToken: 'refresh-token',
  );

  SharedInfo.actualUser = user;
  group('Top bar test component ', () {
    testWidgets(
      'Should render',
      (WidgetTester tester) async {
        await tester.pumpWidget(MyWidget());
      },
    );
  });
}
