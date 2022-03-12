import 'package:caderneta_campo_digital/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:caderneta_campo_digital/pages/ProducerRegister/main.dart';
import 'package:caderneta_campo_digital/pages/TechnicianRegister/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderneta de Campo Digital',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
