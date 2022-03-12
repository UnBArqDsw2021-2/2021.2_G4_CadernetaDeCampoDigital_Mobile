import 'package:caderneta_campo_digital/pages/home_produtor/home_produtor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caderneta de Campo Digital',
      theme: ThemeData(
          primaryColor: Color(0xFF00B4D8),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomeProdutor(),
    );
  }
}
