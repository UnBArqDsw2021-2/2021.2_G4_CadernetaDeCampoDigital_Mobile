import 'package:caderneta_campo_digital/controllers/add_property/add_property_controller.dart';
import 'package:caderneta_campo_digital/pages/splash_screen.dart';
import 'package:caderneta_campo_digital/services/add_property/add_property_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddPropertyController(
            AddPropertyService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Caderneta de Campo Digital',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenPage(),
      ),
    );
  }
}
