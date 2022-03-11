<<<<<<< HEAD
import 'package:caderneta_campo_digital/pages/login/login_page.dart';
=======
import 'package:caderneta_campo_digital/pages/ProducerRegister/main.dart';
<<<<<<< HEAD
>>>>>>> (#110) Criando página de cadastro de produtor
=======
import 'package:caderneta_campo_digital/pages/TechnicianRegister/main.dart';
>>>>>>> (#110) Criando pagina de cadastro de tecnico
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
