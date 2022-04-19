import 'package:caderneta_campo_digital/global/global.dart';
import 'package:caderneta_campo_digital/models/UserModel.dart';
import 'package:caderneta_campo_digital/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProfilePage profilePage = ProfilePage();

  final UserModel user = UserModel(
    name: 'Fabiana Julia Jesus',
    cpf: '640.158.159-04',
    isProductor: true,
    idUsuario: '02',
    accessToken: 'access-token',
    refreshToken: 'refresh-token',
  );

  SharedInfo.actualUser = user;

  Widget makeTestableWidget(widget) {
    return MaterialApp(
      home: widget,
    );
  }

  group('Profile page', () {
    testWidgets('should render profile page', (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(profilePage));
    });
  });
}
