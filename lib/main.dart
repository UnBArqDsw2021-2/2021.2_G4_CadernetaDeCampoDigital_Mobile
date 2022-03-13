import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:caderneta_campo_digital/pages/home_tecnico/home_tecnico.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderneta de Campo Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeTecnico(),
    );
  }
}
